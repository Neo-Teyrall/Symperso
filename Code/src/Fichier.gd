extends MenuButton


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    get_popup().add_item("Export", 1)
    get_popup().add_item("Save", 2)
    get_popup().add_item('load', 3)
    get_popup().add_item("Quit",4)
    self.get_popup().connect("id_pressed",self,"_action")
    pass # Replace with function body.

func _action(id):
    var filename = get_node("/root/Node/PanelContainer/HBox/VBox/Nom/HBox/entree").text
    filename = filename.replace(" ","-")
    if id == 1:
        get_node("/root/Node/interface/Export/FileDialog").current_file = (
            filename + ".png")
        get_node("/root/Node/interface/Export/FileDialog").popup()
    if id == 2 :
        filename = filename + ".symperso"
        get_parent().get_parent().get_parent().get_node("Save/FileDialog").current_file = filename
        get_parent().get_parent().get_parent().get_node("Save/FileDialog").popup()
    if id == 3 : 
        get_parent().get_parent().get_parent().get_node("Open/FileDialog").popup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#    pass


func _on_LineEdit_text_changed(new_text: String) -> void:
    pass # Replace with function body.
