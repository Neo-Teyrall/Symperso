extends LineEdit


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

var p 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
   
    p = get_parent().get_parent()
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#    pass
func maj():
    self.text = str(
    int(p.get_node("Ag-As-Di/Agi").get_value()) +
    int(p.get_node("Fo-Pe-Pr/Pre").get_value()) +
    int(p.get_node("Fo-Pe-Pr/For").get_value()) +
    int(p.get_node("Ag-As-Di/Ast").get_value()) +
    int(p.get_node("Fo-Pe-Pr/Per").get_value()) +
    int(p.get_node("Vi-Vo-Sum/Vig").get_value()) +
    int(p.get_node("Vi-Vo-Sum/Vol").get_value()) +
    int(p.get_node("Ag-As-Di/Dis").get_value()))
