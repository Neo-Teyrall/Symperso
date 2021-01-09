extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.

func _set(property: String, value) -> bool:
    if property== "visible" : 
        set_visible(value)
        return true
    return true
    
func set_visible(val):
    visible = val
    if val :
        $"../Container".rect_size.y = self.rect_size.y
    else : 
        $"../Container".rect_size.y = $"../Container".rect_min_size.y

