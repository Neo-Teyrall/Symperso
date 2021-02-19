extends PanelContainer
tool
signal modified
export var label : String  = "Label" setget set_label

func set_label(new_str : String) -> void:
    label = new_str
    $HBox/Label.text = new_str

######## text ########
func get_text():
    return $HBox/entree.text

func set_text(new_text): 
    $HBox/entree.text = new_text

######################

func set_data(data) -> void:
    set_text(data)

func get_data() -> String : 
    return str(get_text())

func _ready() -> void:
    get_node(all_info.main_node).connect("unfocus",$HBox/entree,"release_focus")
    pass

func _unhandled_input(event: InputEvent) -> void:
    if $HBox/entree.has_focus():
        if event.is_action_pressed("ui_cancel"):
            $HBox/entree.release_focus()


func _on_entree_text_changed(new_text: String) -> void:
    emit_signal("modified")
    pass # Replace with function body.

