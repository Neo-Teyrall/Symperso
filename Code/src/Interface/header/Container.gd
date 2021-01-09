extends Container


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


var lock1 = false
func _on_Container_mouse_entered() -> void:
    $"../Tooline".visible = true
    pass

func _on_Container_mouse_exited() -> void:
    pass


func _on_Tooline_mouse_exited() -> void:
    if lock1 :
        return
    $"../Tooline".visible= false
    pass


func _on_ScrollContainer_mouse_entered() -> void:
    pass # Replace with function body.


func _on_ScrollContainer_mouse_exited() -> void:
    pass # Replace with function body.

