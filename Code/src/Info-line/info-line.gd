extends PanelContainer
tool

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

func _ready() -> void:
    pass

func _unhandled_input(event: InputEvent) -> void:
    if $HBox/entree.has_focus():
        if event.is_action_pressed("ui_cancel"):
            $HBox/entree.release_focus()

