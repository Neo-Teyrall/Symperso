extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.




func _on_PanelContainer_mouse_entered() -> void:
    $HBox/CenterContainer/Button.visible = true
    pass # Replace with function body.


func _on_PanelContainer_mouse_exited() -> void:
    $HBox/CenterContainer/Button.visible = false
    pass # Replace with function body.
