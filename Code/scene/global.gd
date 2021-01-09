extends ScrollContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    print("ready_global")
    pass # Replace with function body.




func _on_Global_mouse_entered() -> void:
    print("entre")
    get_node(all_info.main_node).Tooline.visible = false
    pass # Replace with function body.


func _on_V_mouse_entered() -> void:
    print("entre")
    get_node(all_info.main_node).Tooline.visible = false
    pass # Replace with function body.
