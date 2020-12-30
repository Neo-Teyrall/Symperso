extends Node


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
onready var VBox = get_node("Global/Panel/H/V")
func _ready() -> void:

    pass # Replace with function body.
var filepath = ""
func _input(event: InputEvent) -> void:
    if event.is_action_pressed("capture"):
        get_node("/root/Node/interface/Export").visible = true
func _export(file_path):
    self.filepath = file_path
    get_node("interface/Export").visible = false
    get_node("interface/Info").visible = false
    get_node("interface/Tooline").visible = false
    $Timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#    pass


func _on_Timer_timeout() -> void:
    var image = get_viewport().get_texture().get_data()
    image.flip_y()
    image.save_png(self.filepath)
    get_node("interface/Tooline").visible = true
    $Timer.stop()
    pass # Replace with function body.
    
func _save(file_path): 
    print(file_path)
    var str_save = ""
    str_save += VBox.get_node("Nom/HBox/entree").text
    str_save += "\t;\n" + VBox.get_node("Race/HBox/entree").text
    str_save += "\t;\n" + VBox.get_node("Résistance/HBox/entree").text
    str_save += "\t;\n" + VBox.get_node("Traits/HBoxContainer/PanelContainer/TextEdit").text
    str_save += "\t;\n" + str(VBox.get_node("Charac/Ag-As-Di/Agi").value)
    str_save += "\t;\n" + str(VBox.get_node("Charac/Ag-As-Di/Ast").value)
    str_save += "\t;\n" + str(VBox.get_node("Charac/Ag-As-Di/Dis").value)
    str_save += "\t;\n" + str(VBox.get_node("Charac/Fo-Pe-Pr/For").value)
    str_save += "\t;\n" + str(VBox.get_node("Charac/Fo-Pe-Pr/Per").value)
    str_save += "\t;\n" + str(VBox.get_node("Charac/Fo-Pe-Pr/Pre").value)
    str_save += "\t;\n" + str(VBox.get_node("Charac/Vi-Vo-Sum/Vig").value)
    str_save += "\t;\n" + str(VBox.get_node("Charac/Vi-Vo-Sum/Vol").value)
    str_save += "\t;\n" + VBox.get_node("Talents/HBoxContainer/PanelContainer/TextEdit").text
    str_save += "\t;\n" + VBox.get_node("Armes/HBoxContainer/PanelContainer/TextEdit").text
    str_save += "\t;\n" + VBox.get_node("Armures/HBoxContainer/PanelContainer/TextEdit").text
    str_save += "\t;\n" + VBox.get_node("Défence/HBoxContainer/PanelContainer/TextEdit").text
    str_save += "\t;\n" + VBox.get_node("HBoxContainer2/Endurence/HBox/entree").text
    str_save += "\t;\n" + VBox.get_node("HBoxContainer2/Resis_Douleur/HBox/entree").text
    str_save += "\t;\n" + VBox.get_node("Equipement/HBoxContainer/PanelContainer/TextEdit").text
    str_save += "\t;\n" + VBox.get_node("Ombre/HBoxContainer/PanelContainer/TextEdit").text
    str_save += "\t;\n" + VBox.get_node("Tactiques/HBoxContainer/PanelContainer/TextEdit").text
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
    VBox.get_node("Nom/HBox/entree").text = splited[0]
    VBox.get_node("Race/HBox/entree").text = splited[1]
    VBox.get_node("Résistance/HBox/entree").text = splited[2]
    VBox.get_node("Traits/HBoxContainer/PanelContainer/TextEdit").text = splited[3]
    VBox.get_node("Charac/Ag-As-Di/Agi").value = int(splited[4])
    VBox.get_node("Charac/Ag-As-Di/Ast").value = int(splited[5])
    VBox.get_node("Charac/Ag-As-Di/Dis").value = int(splited[6])
    VBox.get_node("Charac/Fo-Pe-Pr/For").value = int(splited[7])
    VBox.get_node("Charac/Fo-Pe-Pr/Per").value = int(splited[8])
    VBox.get_node("Charac/Fo-Pe-Pr/Pre").value = int(splited[9])
    VBox.get_node("Charac/Vi-Vo-Sum/Vig").value = int(splited[10])
    VBox.get_node("Charac/Vi-Vo-Sum/Vol").value = int(splited[11])
    VBox.get_node("Talents/HBoxContainer/PanelContainer/TextEdit").text = splited[12]
    VBox.get_node("Armes/HBoxContainer/PanelContainer/TextEdit").text = splited[13]
    VBox.get_node("Armures/HBoxContainer/PanelContainer/TextEdit").text = splited[14]
    VBox.get_node("Défence/HBoxContainer/PanelContainer/TextEdit").text = splited[15]
    VBox.get_node("HBoxContainer2/Endurence/HBox/entree").text = splited[16]
    VBox.get_node("HBoxContainer2/Resis_Douleur/HBox/entree").text = splited[17]
    VBox.get_node("Equipement/HBoxContainer/PanelContainer/TextEdit").text = splited[18]
    VBox.get_node("Ombre/HBoxContainer/PanelContainer/TextEdit").text = splited[19]
    VBox.get_node("Tactiques/HBoxContainer/PanelContainer/TextEdit").text = splited[20]
