extends PanelContainer


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#    pass


func _on_OK_pressed() -> void:
#    if $VBox/LineEdit.text.find(".png")> 0:
#        print("ok")
#        return 
#    print("non")
#
#    pos$VBox/LineEdit.text.find_last('.')
#    $VBox/LineEdit.text.split()
#    return
    get_node("/root/Node").capture()
    self.visible = false
    pass # Replace with function body.


func _on_Annuler_pressed() -> void:
    self.visible = false
    
    pass # Replace with function body.
