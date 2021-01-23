extends HBoxContainer
tool

###############################################################################
###################             signales                    ###################
###############################################################################
signal maj 
###############################################################################
###################             variables                   ###################
###############################################################################
export var label : String  = "Label" setget set_label
var value = 10 setget set_value, get_value
var up_pressed : bool = false
var down_pressed : bool = true
var time_down_presesd : float = 0.0 
var time_up_pressed : float = 0.0
###############################################################################
###################              set_get                    ###################
###############################################################################
func set_label(new_str : String) -> void:
    label = new_str
    $Label.text = new_str

###########

func get_value(): 
    return value

func set_value(new_value): 
    if new_value > 20 : 
        new_value = 20
    if new_value <  0 :
        new_value = 0
    value = new_value
    $val.text = str(value)
    if value == 10 :
         $diff.text = "(0)"
    elif value > 10 : 
        $diff.text = "(" + "-" + str(value - 10)+ ")"
    else : 
        $diff.text = "(" + "+" +str((value - 10) * -1)+ ")"
    emit_signal("maj")

############

func _ready() -> void:
    self.connect("maj", get_node(all_info.charac_to_Sum), "maj")
    get_node(all_info.main_node).connect("unfocus",self,"hide_button")



func hide_button():
    $ButtonBox.visible = false

func _on_editor_mouse_entered() -> void:
    $ButtonBox.visible = true
    pass # Replace with function body.


func _on_editor_mouse_exited() -> void:
    $ButtonBox.visible = false
    

#### Up button ####

func _on_Up_button_down() -> void:
    self.value += 1
    self.up_pressed = true
    $Timer_up.start()

func _on_Up_button_up() -> void:
    self.up_pressed = false
    $Timer_up.stop()
    $tic_up.stop()
    $tic_up.wait_time = 0.5
    
func _on_Timer_up_timeout() -> void:
    $tic_up.wait_time = 0.5
    $Timer_up.stop()
    $tic_up.start()

func _on_tic_up_timeout() -> void:
    self.value += 1
    $tic_up.wait_time *= 0.8
    
    
########## down button ###################


func _on_Down_button_down() -> void:
    self.value -= 1 
    self.down_pressed = true
    $Timer_down.start()
    pass # Replace with function body.

func _on_Down_button_up() -> void:
    self.down_pressed = false
    $Timer_down.stop()
    $tic_down.wait_time = 0.5
    $tic_down.stop()
    pass # Replace with function body.

func _on_Timer_down_timeout() -> void:
    $Timer_down.stop()
    $tic_down.wait_time = 0.5
    $tic_down.start()
    pass # Replace with function body.

func _on_tic_down_timeout() -> void:
    $tic_down.wait_time *= 0.8
    self.value -= 1    
    pass # Replace with function body.
