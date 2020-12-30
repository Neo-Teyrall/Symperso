extends PanelContainer
tool


export var label : String  = "Label" setget set_label
func set_label(new_str : String) -> void:
    label = new_str
    $HBoxContainer/Label.text = new_str


var text_edit : TextEdit = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    text_edit = $HBoxContainer/PanelContainer/TextEdit
    text_edit.wrap_enabled = true
    text_edit



func _on_TextEdit_text_changed() -> void:
    count_line()
    pass

    
func count_line():
    var taille= 50
    var cpt = 0
    var count = 1 
    for i in text_edit.text:
        if cpt > taille :
            count += 1 
            cpt = 0 
        cpt += 1 
        if i =="\n":
            count +=1
            cpt = 0
    var ms = 19 * count
    $HBoxContainer/PanelContainer.rect_min_size.y = ms


func _on_TextEdit_focus_entered() -> void:
    if text_edit.text == "Entré...":
        text_edit.text = ""


func _unhandled_input(event: InputEvent) -> void:
    if $HBoxContainer/PanelContainer/TextEdit.has_focus():
        if event.is_action_pressed("ui_cancel"):
            $HBoxContainer/PanelContainer/TextEdit.release_focus()

func _on_TextEdit_focus_exited() -> void:
    if $HBoxContainer/PanelContainer/TextEdit.text == "":
        $HBoxContainer/PanelContainer/TextEdit.text = "Entré..."
    pass # Replace with function body.
