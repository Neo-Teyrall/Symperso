extends Label


var p : VBoxContainer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    print(get_path())
    p = get_parent().get_parent()
    pass # Replace with function body.


func maj():
    print("call")
    self.text = str(
    int(p.get_node("Ag_As_Di/Agi").get_value()) +
    int(p.get_node("Fo_Pe_Pr/Pre").get_value()) +
    int(p.get_node("Fo_Pe_Pr/For").get_value()) +
    int(p.get_node("Ag_As_Di/Ast").get_value()) +
    int(p.get_node("Fo_Pe_Pr/Per").get_value()) +
    int(p.get_node("Vi_Vo_Sum/Vig").get_value()) +
    int(p.get_node("Vi_Vo_Sum/Vol").get_value()) +
    int(p.get_node("Ag_As_Di/Dis").get_value()))
