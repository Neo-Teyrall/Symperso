extends ScrollContainer


onready var VBox = $Panel/H/V
onready var Nom = $Panel/H/V/Nom
onready var Race = $Panel/H/V/Race
onready var description = $Panel/H/V/Description
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

var dic_object : Dictionary = {}

var is_saved = true
signal has_load_data
var save_path = null
func modified(): 
    is_saved = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    get_v_scrollbar().max_value = 927
    __connect_modified()
    __connect_has_load_data()
    __ready_dic_objet()
    
    
func __connect_modified():
    Nom.connect("modified",self,"modified")
    Race.connect("modified",self,"modified")
    Resistance.connect("modified",self,"modified")
    Traits.connect("modified",self,"modified")
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
    
    
func __connect_has_load_data():
    self.connect("has_load_data",Traits,"count_line_2")
    self.connect("has_load_data",Talents,"count_line_2")
    self.connect("has_load_data",Armes,"count_line_2")
    self.connect("has_load_data",Armures,"count_line_2")
    self.connect("has_load_data",Defence,"count_line_2")
    self.connect("has_load_data",Equipement,"count_line_2")
    self.connect("has_load_data",Ombre,"count_line_2")
    self.connect("has_load_data",Tactiques,"count_line_2")

func __ready_dic_objet():
    self.dic_object = (
        {
            $Panel/H/V/Nom.name : $Panel/H/V/Nom,
            $Panel/H/V/Race.name : $Panel/H/V/Race,
            $Panel/H/V/Description.name : $Panel/H/V/Description,
            $Panel/H/V/Resistance.name : $Panel/H/V/Resistance,
            $Panel/H/V/Traits.name : $Panel/H/V/Traits,
            $Panel/H/V/Charac/Ag_As_Di/Agi.name : $Panel/H/V/Charac/Ag_As_Di/Agi, 
            $Panel/H/V/Charac/Ag_As_Di/Ast.name : $Panel/H/V/Charac/Ag_As_Di/Ast,
            $Panel/H/V/Charac/Ag_As_Di/Dis.name : $Panel/H/V/Charac/Ag_As_Di/Dis,
            $Panel/H/V/Charac/Fo_Pe_Pr/For.name : $Panel/H/V/Charac/Fo_Pe_Pr/For,
            $Panel/H/V/Charac/Fo_Pe_Pr/Per.name : $Panel/H/V/Charac/Fo_Pe_Pr/Per,
            $Panel/H/V/Charac/Fo_Pe_Pr/Pre.name : $Panel/H/V/Charac/Fo_Pe_Pr/Pre,
            $Panel/H/V/Charac/Vi_Vo_Sum/Vig.name : $Panel/H/V/Charac/Vi_Vo_Sum/Vig,
            $Panel/H/V/Charac/Vi_Vo_Sum/Vol.name : $Panel/H/V/Charac/Vi_Vo_Sum/Vol,
            $Panel/H/V/Talents.name : $Panel/H/V/Talents,
            $Panel/H/V/Armes.name : $Panel/H/V/Armes,
            $Panel/H/V/Armures.name : $Panel/H/V/Armures, 
            $Panel/H/V/Defence.name : $Panel/H/V/Defence,
            $Panel/H/V/H/Endurence.name : $Panel/H/V/H/Endurence,
            $Panel/H/V/Resistance.name : $Panel/H/V/Resistance, 
            $Panel/H/V/Equipement.name : $Panel/H/V/Equipement,
            $Panel/H/V/Ombre.name : $Panel/H/V/Ombre,
            $Panel/H/V/Tactiques.name : $Panel/H/V/Tactiques
        })



func _set(property: String, value) -> bool:
    if property == "name" : 
        name = value
        return true
    return true


var _id
func _build(new_name, new_id):
    self._id = new_id
    self.name = str(new_id)


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


func load_data_v1(filin : File) -> void:
    var input = filin.get_as_text()
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


func load_data(filin : File):
    var line = filin.get_line()
    print("ICI")
    print(line)
    if line in "0.1\t;" : 
        print("load 0.1")
        load_data_v1(filin)
    if line == "V2" :
        load_data_v2(filin)


func load_data_v2(filin : File):
    var line = filin.get_line() 
    var loaded : Array
    while not filin.eof_reached() : 
        loaded = load_format(line)
        if loaded[0] in dic_object.keys() :
            dic_object[loaded[0]].set_data(loaded[1])
        line = filin.get_line()


func save_data(filout : File):
    filout.store_string("V2\n")
    for i in dic_object.keys() : 
        print(i,dic_object[i].get_data())
        filout.store_string(save_format(i, dic_object[i].get_data()))


func save_format(key : String, save: String) :
    save = save.replace("\n","\\n")
    save = save.replace("\t","\\t")
    save = save.replace('"','\\"')
    save = save.replace("\'","\\'")
    save = save.replace("<","\\<")
    save = save.replace(">", "\\>")
    save = save.replace(" ","\\ ")
    var out_format = str("< " + str(key) + " \"" + save + ' ">\n')
    return str(out_format)


func load_format(line : String) -> Array:
    var splited = line.split(' "')
    var key = splited[0].split(" ")[1]
    var value = splited[1]
    value = value.replace("\\n","\n")
    value = value.replace("\\t","\t")
    value = value.replace('\\"','"')
    value = value.replace("\\'","'")
    value = value.replace("\\ "," ")
    value = value.replace("\\<","<")
    value = value.replace("\\>", ">")
    return [key,value]
