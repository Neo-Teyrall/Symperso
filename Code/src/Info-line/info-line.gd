extends PanelContainer
tool
export var label : String  = "Label" setget set_label
func set_label(new_str : String) -> void:
    label = new_str
    $HBox/Label.text = new_str
    # Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#    pass
