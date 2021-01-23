extends Node

################################################################################
###################              Node shortcut             #####################
################################################################################
## interface ##
onready var Interface = $interface
onready var Tooline = $interface/Tooline
onready var Fichier= $interface/Tooline/V/H/Fichier
onready var Load = $interface/Load
onready var Save = $interface/Save
onready var Export = $interface/Export
onready var Onglets = $interface/Tooline/V/ScrollContainer/Onglets
onready var Unsaved = $interface/Unsaved
# /\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\

onready var window_size = all_info.window_size setget set_window_size

signal unfocus

###############################################################################
#################                  Onglets                 ####################
###############################################################################

var valeur : Dictionary = {}
var onglets : Dictionary = {}
var current_onglet = null
var nb_onglet_create= 0 

var Onglet = preload("res://src/Interface/Onglet/onglet.tscn")
var Session = preload("res://src/main_part/main-part.tscn")
var last_id_use = -1

func _ready() -> void:
    get_tree().set_auto_accept_quit(false)
    create_onglet()
    set_resolution()

func _notification(what: int) -> void:
    if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST :
        ask_quit()
        
func ask_quit():
    for i in onglets: 
        if not onglets[i]["session"].is_saved : 
            Unsaved.onglet_asked = i 
            return
    get_tree().quit()


func create_onglet(new_ong_name = null):
    if new_ong_name == null: 
        new_ong_name = "Unamed_" + str(nb_onglet_create)
    last_id_use += 1
    
    var new_onglet = Onglet.instance()
    var new_session = Session.instance()
    Onglets.add_child(new_onglet)
    $Gestionnaire.add_child(new_session)
    new_onglet._build(new_ong_name,last_id_use)
    new_session._build(new_ong_name, last_id_use)
    
    onglets[last_id_use] = {"onglet" : new_onglet, "session" : new_session}
    _switch_onglet(last_id_use)
    nb_onglet_create += 1

func ask_delete_onglet(onglet_nom): 
    if not onglets[onglet_nom]["session"].is_saved :
        Unsaved.set_onglet_asked(onglet_nom)
        Unsaved.popup()
    else :
        _delete_onglet(onglet_nom)
    pass

func _delete_onglet(onglet_nom): 
    var next_onglet = null
    if len(onglets.keys()) > 1 :
        if onglets.keys()[0] == onglet_nom: 
            next_onglet = onglets.keys()[1]
        else : 
            next_onglet = onglets.keys()[0]
        onglets[onglet_nom]["onglet"].queue_free()
        onglets[onglet_nom]["session"].queue_free()
        onglets.erase(onglet_nom)
        current_onglet = next_onglet
        _switch_onglet(next_onglet)
    else :
        get_tree().quit()

func _switch_onglet(new_onglet) -> void:
    if current_onglet != null :
        print("onglet deselection")
        onglets[current_onglet]["onglet"]._unselect()
        onglets[current_onglet]["session"]._unselect()
    current_onglet = new_onglet
    onglets[current_onglet]["onglet"]._select()
    onglets[current_onglet]["session"]._select()


func change_onglet_name(old_name, new_name):
    onglets[current_onglet]["session"].name = new_name
    onglets[current_onglet]["onglet"].name = new_name

func get_current_session(): 
    return onglets[current_onglet]["session"]


###############################################################################
####################                export                 ####################
###############################################################################

func set_window_size(new : Vector2) -> void: 
    window_size = new
    OS.set_window_size(new)
    get_viewport().set_size_override(true,new,Vector2(0,0))
    get_node("/root").size = new


func set_resolution(): 
    get_node("/root").size = Vector2(450,945)

var filepath = ""

func _export(file_path):
    self.filepath = file_path
    Export.visible = false
    Tooline.visible = false
    self.window_size.y = onglets[current_onglet]["session"].get_v_scrollbar().max_value
    emit_signal("unfocus")
    $Timer.start()


func _on_Timer_timeout() -> void:
    var image = get_viewport().get_texture().get_data()
    image.flip_y()
    image.save_png(self.filepath)
    self.window_size = all_info.window_size
    $Timer.stop()



###############################################################################
###################              Save / Load               ####################
###############################################################################

func try_save():
    if onglets[current_onglet]["session"].save_path == null: 
        Fichier.ask_save_path()
        return
    just_save(onglets[current_onglet]["session"].save_path)
    
    
    pass

func get_new_name_from_file_path(file_path)-> String:
    var new_name = file_path.split("/")
    new_name = new_name[len(new_name)-1]
    new_name = new_name.split(".")[0]
    return new_name
    
func _load(file_path):
    var new_name = get_new_name_from_file_path(file_path)
    var file = File.new()
    file.open(file_path, File.READ)
    var content = file.get_as_text()
    file.close()
    create_onglet(new_name)
    onglets[current_onglet]["session"]._load_all_data(content)
    onglets[current_onglet]["session"].save_path = file_path

func save_and_close(onglet):
    _switch_onglet(onglet)
    Save.popup()
    

func _save(file_path):
    
    var new_name = get_new_name_from_file_path(file_path)
    just_save(file_path)
    onglets[current_onglet]["session"].save_path = file_path
    change_onglet_name(current_onglet,new_name)

func just_save(file_path): 
    onglets[current_onglet]["session"].is_saved = true
    var file = File.new()
    file.open(file_path,File.WRITE)
    file.store_string(onglets[current_onglet]["session"]._get_all_data())
    file.close()
    
