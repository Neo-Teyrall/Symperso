extends PanelContainer
tool
export var label : String  = "Label" setget set_label
func set_label(new_str : String) -> void:
    label = new_str
    $HBoxContainer/Label.text = new_str
    # Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#    pass


func _on_TextEdit_text_changed() -> void:
    count_line()
    pass # Replace with function body.
func count_line():
    var count = 1 
    for i in $HBoxContainer/PanelContainer/TextEdit.text:
        if i =="\n":
            count +=1
    var ms = 19*count
    $HBoxContainer/PanelContainer.rect_min_size.y = ms


func _on_TextEdit_focus_entered() -> void:
    if $HBoxContainer/PanelContainer/TextEdit.text == "entré...":
        $HBoxContainer/PanelContainer/TextEdit.text = ""
    pass # Replace with function body.
