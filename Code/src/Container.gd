extends Container


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


var lock1 = false
func _on_Container_mouse_entered() -> void:
    $Tooline.visible = true


func _on_Container_mouse_exited() -> void:
    if lock1 :
        return
    $Tooline.visible = false
