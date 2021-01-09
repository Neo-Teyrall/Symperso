extends HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.



func _on_Button_pressed() -> void:
    get_node(all_info.main_node).create_onglet()
    pass # Replace with function body.
