extends Container


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


var lock1 = false
func _on_Container_mouse_entered() -> void:
    print("entre")
    $"../Tooline".visible = true
    pass

func _on_Container_mouse_exited() -> void:
#    print("sortie")
#    if lock1 :
#        return
#    $"../Tooline".visible= false
    pass


func _on_Tooline_mouse_exited() -> void:
    print("Tooline sortie ", lock1)
    if lock1 :
        print('loked')
        return
    # print("unlocked")
    $"../Tooline".visible= false
    pass


func _on_ScrollContainer_mouse_entered() -> void:
#    print("lock")
#    lock1 = true
    pass # Replace with function body.


func _on_ScrollContainer_mouse_exited() -> void:
#    print("unlock")
#    lock1 = false
    pass # Replace with function body.

