extends ScrollContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    self.get_h_scrollbar().mouse_filter = Control.MOUSE_FILTER_PASS
    pass # Replace with function body.
