extends HBoxContainer
signal maj 
tool
export var label : String  = "Label" setget set_label
func set_label(new_str : String) -> void:
    label = new_str
    $Label.text = new_str
func _ready() -> void:
    self.connect("maj", get_parent().get_parent().get_node("Vi-Vo-Sum/sum"), "maj")
    
func _on_value_text_entered(new_text: String) -> void:
    if not verif(new_text):
        new_text = "10" 
    var val = (10 - int($value.text))
    if val > 0 : 
        $value.text +=  " (+" + str(val) +")"
    else :
        $value.text += " (" + str(val)+ ")"
    emit_signal("maj")
    entered = true

func _on_value_focus_entered() -> void:
    self.entered = false
    if len($value.text) == 0:
        return
    $value.text = $value.text[0]+ $value.text[1]
    pass # Replace with function body.
    
var focused = false
var entered = false

func get_value() -> int :
    if $value.text[0]  == " " or $value.text[0] =="(":
        return 10
    if $value.text[1] == " " or $value.text[1] == "(":
        return int($value.text[0])
    return int($value.text[0]+ $value.text[1])

func verif(in_str) -> bool: 
    if len(in_str) == 0 : 
        return false
    var a = "1234567890"
    for i in in_str: 
        if a.count(i)==0 : 
            return false
    return true
    
func _on_value_focus_exited() -> void:
    if self.entered :
        self.entered = false
        return 
    if not verif($value.text): 
        $value.text = "10"
    var val = (10 - int($value.text))
    if val > 0 : 
        $value.text +=  " (+" + str(val) +")"
    else :
        $value.text += " (" + str(val)+ ")"
    emit_signal("maj")
    pass # Replace with function body.
