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
onready var Fichier= $interface/Container/Tooline/HBoxContainer/Fichier
onready var Load = $interface/Load
onready var Save = $interface/Save
onready var Export = $interface/Export
# /\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\_/\

onready var window_size = all_info.window_size setget set_window_size

func set_window_size(new : Vector2) -> void: 
    window_size = new
    OS.set_window_size(new)
    get_viewport().set_size_override(true,new,Vector2(0,0))
    get_node("/root").size = new

#########

func _ready() -> void:
    print("oui")
    $Global.get_v_scrollbar().value
    set_resolution()
    pass # Replace with function body.


func set_resolution(): 
    get_node("/root").size = Vector2(450,945)


func _input(event: InputEvent) -> void:
    if event.is_action_pressed("capture"):
        get_node("/root/Node/interface/Export").visible = true


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


func _save(file_path): 
    var str_save = "0.1"
    str_save += "\t;\n" + Nom.get_text()
    str_save += "\t;\n" + Race.get_text()
    str_save += "\t;\n" + Resistance.get_text()
    str_save += "\t;\n" + Traits.get_text()
    str_save += "\t;\n" + str(Charac.get_agi())
    str_save += "\t;\n" + str(Charac.get_Ast())
    str_save += "\t;\n" + str(Charac.get_Dis())
    str_save += "\t;\n" + str(Charac.get_For())
    str_save += "\t;\n" + str(Charac.get_Per())
    str_save += "\t;\n" + str(Charac.get_Pre())
    str_save += "\t;\n" + str(Charac.get_Vig())
    str_save += "\t;\n" + str(Charac.get_Vol())
    str_save += "\t;\n" + Talents.get_text()
    str_save += "\t;\n" + Armes.get_text()
    str_save += "\t;\n" + Armures.get_text()
    str_save += "\t;\n" + Defence.get_text()
    str_save += "\t;\n" + Endurence.get_text()
    str_save += "\t;\n" + Resi_Doul.get_text()
    str_save += "\t;\n" + Equipement.get_text()
    str_save += "\t;\n" + Ombre.get_text()
    str_save += "\t;\n" + Tactiques.get_text()
    var file = File.new()
    file.open(file_path,File.WRITE)
    file.store_string(str_save)
    file.close()



func _load(file_path):
    var file = File.new()
    file.open(file_path, File.READ)
    var content = file.get_as_text()
    file.close()
    var splited = content.split("\t;\n")
    Nom.set_text(splited[1])
    Race.set_text(splited[2])
    Resistance.set_text(splited[3])
    Traits.set_text(splited[4])
    Charac.get_agi(int(splited[5]))
    Charac.get_ast(int(splited[6]))
    Charac.get_dis(int(splited[7]))
    Charac.get_for(int(splited[8]))
    Charac.get_per(int(splited[9]))
    Charac.get_pre(int(splited[10]))
    Charac.get_vig(int(splited[11]))
    Charac.get_vol(int(splited[12]))
    Talents.set_text(splited[13])
    Armes.set_text(splited[14])
    Armures.set_text(splited[15])
    Defence.set_text(splited[16])
    Endurence.set_text(splited[17])
    Resi_Doul.set_text(splited[18])
    Equipement.set_text(splited[19])
    Ombre.set_text(splited[20])
    Tactiques.set_text(splited[21])
