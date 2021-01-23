extends ScrollContainer


onready var VBox = $Panel/H/V
onready var Nom = $Panel/H/V/Nom
onready var Race = $Panel/H/V/Race
onready var Resistance = $Panel/H/V/Resistance
onready var Traits = $Panel/H/V/Traits
onready var Charac = $Panel/H/V/Charac
onready var Talents = $Panel/H/V/Talents
onready var Armes = $Panel/H/V/Armes
onready var Armures = $Panel/H/V/Armures
onready var Defence = $Panel/H/V/Defence
onready var Endurence = $Panel/H/V/H/Endurence
onready var Resi_Doul = $Panel/H/V/H/Resis_Douleur
onready var Equipement = $Panel/H/V/Equipement
onready var Ombre = $Panel/H/V/Ombre
onready var Tactiques = $Panel/H/V/Tactiques
onready var Sum = $Panel/H/V/Charac/Vi_Vo_Sum/sum

var is_saved = true
signal has_load_data
var save_path = null
func modified(): 
    is_saved = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    get_v_scrollbar().max_value = 927
    Nom.connect("modified",self,"modified")
    Race.connect("modified",self,"modified")
    Resistance.connect("modified",self,"modified")
    Traits.connect("modified",self,"modified")
#    Charac.connect("modified",self,"modified")
    Talents.connect("modified",self,"modified")
    Armes.connect("modified",self,"modified")
    Armures.connect("modified",self,"modified")
    Defence.connect("modified",self,"modified")
    Endurence.connect("modified",self,"modified")
    Resi_Doul.connect("modified",self,"modified")
    Equipement.connect("modified",self,"modified")
    Ombre.connect("modified",self,"modified")
    Tactiques.connect("modified",self,"modified")
    Sum.connect("modified",self,"modified")
    self.connect("has_load_data",Traits,"count_line_2")
    self.connect("has_load_data",Talents,"count_line_2")
    self.connect("has_load_data",Armes,"count_line_2")
    self.connect("has_load_data",Armures,"count_line_2")
    self.connect("has_load_data",Defence,"count_line_2")
    self.connect("has_load_data",Equipement,"count_line_2")
    self.connect("has_load_data",Ombre,"count_line_2")
    self.connect("has_load_data",Tactiques,"count_line_2")

func _set(property: String, value) -> bool:
    if property == "name" : 
        name = value
        return true
    return true
    pass

var _id 
func _build(new_name, new_id):
    self._id = new_id
    self.name = str(new_id)
    pass

func _select():
    visible = true

func _unselect():
#    print("unselect")
    visible = false

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
    emit_signal("has_load_data")


