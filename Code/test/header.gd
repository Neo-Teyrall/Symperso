extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.



var lock1 = false
func _on_Tooline_mouse_entered() -> void:
    self.visible = true
    pass # Replace with function body.


func _on_Tooline_mouse_exited() -> void:
    if lock1 :
        return
    self.visible = false
    pass # Replace with function body.
