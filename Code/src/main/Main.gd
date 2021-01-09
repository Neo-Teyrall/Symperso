extends Node

################################################################################
###################              Node shortcut             #####################
################################################################################
## global
onready var VBox = $Global/Panel/H/V
onready var Nom = $Global/Panel/H/V/Nom
onready var Race = $Global/Panel/H/V/Race
onready var Resistance = $Global/Panel/H/V/Resistance
onready var Traits = $Global/Panel/H/V/Traits
onready var Charac = $Global/Panel/H/V/Charac
onready var Talents = $Global/Panel/H/V/Talents
onready var Armes = $Global/Panel/H/V/Armes
onready var Armures = $Global/Panel/H/V/Armures
onready var Defence = $Global/Panel/H/V/Defence
onready var Endurence = $Global/Panel/H/V/H/Endurence
onready var Resi_Doul = $Global/Panel/H/V/H/Resis_Douleur
onready var Equipement = $Global/Panel/H/V/Equipement
onready var Ombre = $Global/Panel/H/V/Ombre
onready var Tactiques = $Global/Panel/H/V/Tactiques
onready var Sum = $Global/Panel/H/V/Charac/Vi_Vo_Sum/sum
## interface ##
onready var Interface = $interface
onready var Tooline = $interface/Tooline
onready var Fichier= $interface/Tooline/V/H/Fichier
onready var Load = $interface/Load
onready var Save = $interface/Save
onready var Export = $interface/Export
onready var Onglets = $interface/Tooline/V/ScrollContainer/Onglets
# /\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\

onready var window_size = all_info.window_size setget set_window_size

###############################################################################
#################                  Onglets                 ####################
###############################################################################
var valeur : Dictionary = {}
var onglet : Dictionary = {}
var current_onglet = null
var default_save : String
var nb_onglet_create= 0 

func create_onglet():
    var new_ong_name = "Unamed_" + str(nb_onglet_create)
    var new_onglet = Onglet.instance()
    Onglets.add_child(new_onglet)
    new_onglet._build(new_ong_name)
    onglet[new_ong_name] = default_save
    _switch_onglet(new_ong_name)
    _load_all_data(default_save)
    nb_onglet_create += 1

func _delete_onglet(onglet_nom): 
    var next_onglet = null
    if len(Onglets.get_children()) > 2 :
        if Onglets.get_child(1).name == onglet_nom: 
            next_onglet = Onglets.get_child(2).name
        else : 
            next_onglet = Onglets.get_child(1).name
        onglet.erase(onglet_nom)
        Onglets.get_node(onglet_nom).queue_free()
        _switch_onglet(next_onglet)
    else :
        get_tree().quit()

func _switch_onglet(new_onglet) -> void:
    if new_onglet == current_onglet : 
        return
    else : 
        if current_onglet != null :
            print(current_onglet)
            Onglets.get_node(current_onglet)._unselect()
        onglet[current_onglet] = self._get_all_data()
        _load_all_data(onglet[new_onglet])
        current_onglet = new_onglet
        Onglets.get_node(current_onglet)._select()

var Onglet = preload("res://src/Onglet/onglet.tscn")
func _ready() -> void:
    print("ready_node")
    default_save = _get_all_data()
    create_onglet()
    $Global.get_v_scrollbar().value
    set_resolution()

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
    get_node("interface/Export").visible = false
    get_node("interface/Info").visible = false
    get_node("interface/Container/Tooline").visible = false
    self.window_size.y = $Global.get_v_scrollbar().max_value
    $Timer.start()


func _on_Timer_timeout() -> void:
    var image = get_viewport().get_texture().get_data()
    image.flip_y()
    image.save_png(self.filepath)
    self.window_size = all_info.window_size
    $Timer.stop()


func _get_all_data() -> String: 
    var str_save = "0.1"
    str_save += "\t;\n" + Nom.get_text()
    str_save += "\t;\n" + Race.get_text()
    str_save += "\t;\n" + Resistance.get_text()
    str_save += "\t;\n" + Traits.get_text()
    str_save += "\t;\n" + str(Charac.get_agi())
    str_save += "\t;\n" + str(Charac.get_ast())
    str_save += "\t;\n" + str(Charac.get_dis())
    str_save += "\t;\n" + str(Charac.get_for())
    str_save += "\t;\n" + str(Charac.get_per())
    str_save += "\t;\n" + str(Charac.get_pre())
    str_save += "\t;\n" + str(Charac.get_vig())
    str_save += "\t;\n" + str(Charac.get_vol())
    str_save += "\t;\n" + Talents.get_text()
    str_save += "\t;\n" + Armes.get_text()
    str_save += "\t;\n" + Armures.get_text()
    str_save += "\t;\n" + Defence.get_text()
    str_save += "\t;\n" + Endurence.get_text()
    str_save += "\t;\n" + Resi_Doul.get_text()
    str_save += "\t;\n" + Equipement.get_text()
    str_save += "\t;\n" + Ombre.get_text()
    str_save += "\t;\n" + Tactiques.get_text()
    return str_save


func _load_all_data(input : String) -> void:
    var splited = input.split("\t;\n")
    Nom.set_text(splited[1])
    Race.set_text(splited[2])
    Resistance.set_text(splited[3])
    Traits.set_text(splited[4])
    Charac.set_agi(int(splited[5]))
    Charac.set_ast(int(splited[6]))
    Charac.set_dis(int(splited[7]))
    Charac.set_for(int(splited[8]))
    Charac.set_per(int(splited[9]))
    Charac.set_pre(int(splited[10]))
    Charac.set_vig(int(splited[11]))
    Charac.set_vol(int(splited[12]))
    Talents.set_text(splited[13])
    Armes.set_text(splited[14])
    Armures.set_text(splited[15])
    Defence.set_text(splited[16])
    Endurence.set_text(splited[17])
    Resi_Doul.set_text(splited[18])
    Equipement.set_text(splited[19])
    Ombre.set_text(splited[20])
    Tactiques.set_text(splited[21])

###############################################################################
###################              Save / Load               ####################
###############################################################################

func _load(file_path):
    var file = File.new()
    file.open(file_path, File.READ)
    var content = file.get_as_text()
    file.close()
    _load_all_data(content)

func _save(file_path): 
    var file = File.new()
    file.open(file_path,File.WRITE)
    file.store_string(_get_all_data())
    file.close()
