extends PanelContainer
tool

signal modified
export var label : String  = "Label" setget set_label
func set_label(new_str : String) -> void:
    label = new_str
    $HBoxContainer/Label.text = new_str


var text_edit : TextEdit = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    text_edit = $HBoxContainer/PanelContainer/TextEdit
    text_edit.wrap_enabled = true
    $HBoxContainer/PanelContainer/TextEdit.get_child(1).max_value = 1
    get_node(all_info.main_node).connect("unfocus",$HBoxContainer/PanelContainer/TextEdit,"release_focus")

func get_text():
    return text_edit.text


func set_text(new_text):
    text_edit.text = new_text
    count_line_2()


func set_data(data):
    set_text(data)


func get_data():
    return str(get_text())


func _on_TextEdit_text_changed() -> void:
    
    count_line_2()
    emit_signal("modified")
    pass
    
var cpt = 10 
var l = 0
var space = 20


func count_line_2():
   # if $HBoxContainer/PanelContainer/TextEdit.get_line_count() < 1:
    $HBoxContainer/PanelContainer/Timer1.start()
    $HBoxContainer/PanelContainer/Timer2.stop()
   
    $HBoxContainer/PanelContainer/TextEdit.rect_min_size.y = space
    $HBoxContainer/PanelContainer/TextEdit.rect_size.y = space
    var nb_line = $HBoxContainer/PanelContainer/TextEdit.get_child(1).max_value
    nb_line = int(nb_line)
    $HBoxContainer/PanelContainer/TextEdit.rect_min_size.y = space* nb_line
    $HBoxContainer/PanelContainer/TextEdit.rect_size.y = space* nb_line


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
    var ms = space * count
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


func _on_Timer1_timeout() -> void:
    $HBoxContainer/PanelContainer/TextEdit.rect_min_size.y = space
    $HBoxContainer/PanelContainer/TextEdit.rect_size.y = space
    $HBoxContainer/PanelContainer/TextEdit.get_child(1).value = 0
    $HBoxContainer/PanelContainer/TextEdit.get_child(1).max_value = 1
    $HBoxContainer/PanelContainer/Timer1.stop()
    $HBoxContainer/PanelContainer/Timer2.start()


func _on_Timer2_timeout() -> void:
    var nb_line = $HBoxContainer/PanelContainer/TextEdit.get_child(1).max_value
    nb_line = int(nb_line)
    $HBoxContainer/PanelContainer/TextEdit.rect_min_size.y = space * nb_line
    $HBoxContainer/PanelContainer/TextEdit.rect_size.y = space * nb_line
    $HBoxContainer/PanelContainer/Timer2.stop()
