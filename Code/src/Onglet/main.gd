extends CenterContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.

func _build(new_name) -> void: 
    $PanelContainer/HBox/Button.text = new_name
    self.name = new_name


func _on_Button_pressed() -> void:
    get_node(all_info.main_node)._switch_onglet($PanelContainer/HBox/Button.text)
    pass # Replace with function body.

func _select():
    print("_select")
    $PanelContainer.self_modulate = Color(1,1,0)

func _unselect():
    print("_un_select")
    $PanelContainer.self_modulate = Color(1,1,1)


func _on_Delete_pressed() -> void:
    get_node(all_info.main_node)._delete_onglet(self.name)
    pass # Replace with function body.
