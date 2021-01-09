extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


func _on_OK_pressed() -> void:
    get_node("/root/Node").capture()
    self.visible = false


func _on_Annuler_pressed() -> void:
    self.visible = false
