extends HBoxContainer
signal maj 
tool
export var label : String  = "Label" setget set_label

var value = 10 setget set_value, get_value

func set_label(new_str : String) -> void:
    label = new_str
    $Label.text = new_str

func _ready() -> void:
    self.connect("maj", get_parent().get_parent().get_node("Vi-Vo-Sum/sum"), "maj")
    pass
func get_value(): 
    return value
    
func set_value(new_value): 
    value = new_value
    $val.text = str(value)
    if value > 10 : 
        $diff.text = "(" + "+" + str(value - 10)+ ")"
    else : 
        $diff.text = "(" + str(value - 10)+ ")"
    emit_signal("maj")

func _on_Up_pressed() -> void:
    self.value += 1
    pass # Replace with function body.


func _on_Down_pressed() -> void:
    self.value -= 1
    pass # Replace with function body.




func _on_editor_mouse_entered() -> void:
    $ButtonBox.visible = true
    pass # Replace with function body.


func _on_editor_mouse_exited() -> void:
    $ButtonBox.visible = false
    pass # Replace with function body.
