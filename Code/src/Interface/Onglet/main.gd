extends CenterContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.
var _id = null
func _build(new_name,id) -> void: 
    $PanelContainer/HBox/Button.text = new_name
    self._id = id
    self.name = new_name

func _set(property: String, value) -> bool:
    if property == "name" : 
        name = value
        $PanelContainer/HBox/Button.text = value
        return true
    return true
    pass

func _on_Button_pressed() -> void:
    get_node(all_info.main_node)._switch_onglet(self._id)
    pass # Replace with function body.

func _select():
    $PanelContainer.self_modulate = Color(1,1,0)

func _unselect():
    $PanelContainer.self_modulate = Color(1,1,1)


func _on_Delete_pressed() -> void:
    get_node(all_info.main_node).ask_delete_onglet(self._id)
    pass # Replace with function body.
