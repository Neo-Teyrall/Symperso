extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.

func get_agi():
    return $Ag_As_Di/Agi.value
func set_agi(new_val):
    $Ag_As_Di/Agi.value = new_val
    
func get_ast(): 
    return $Ag_As_Di/Ast.value
func set_ast(new_val):
    $Ag_As_Di/Ast.value = new_val
    
func get_dis(): 
    return $Ag_As_Di/Dis.value
func set_dis(new_val):
    $Ag_As_Di/Dis.value = new_val

func get_for(): 
    return $Fo_Pe_Pr/For.value
func set_for(new_val):
    $Fo_Pe_Pr/For.value = new_val
    
func get_per(): 
    return $Fo_Pe_Pr/Per.value
func set_per(new_val):
    $Fo_Pe_Pr/Per.value = new_val
    
func get_pre(): 
    return $Fo_Pe_Pr/Pre.value
func set_pre(new_val):
    $Fo_Pe_Pr/Pre.value = new_val

func get_vig(): 
    return $Vi_Vo_Sum/Vig.value
func set_vig(new_val):
    $Vi_Vo_Sum/Vig.value = new_val

func get_vol(): 
    return $Vi_Vo_Sum/Vol.value
func set_vol(new_val):
    $Vi_Vo_Sum/Vol.value = new_val
