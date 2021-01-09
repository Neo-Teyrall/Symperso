extends MenuButton


func _ready() -> void:
    get_popup().add_item("Export", 1)
    get_popup().add_item("Save", 2)
    get_popup().add_item('load', 3)
    get_popup().add_item("Quit",4)
    self.get_popup().connect("id_pressed",self,"_action")
    self.get_popup().connect("mouse_exited",self,"popup_mouse_exit")


func _action(id):
    var filename = get_node(all_info.main_node).Nom.get_text()
    filename = filename.replace(" ","-")
    if id == 1:
        get_node(all_info.main_node).Export.current_file = (filename + ".png")
        get_node(all_info.main_node).Export.popup()
        get_parent().get_parent().visible = false
        _end_id_selected()
    if id == 2 :
        filename = filename + ".symperso"
        get_node(all_info.main_node).Save.current_file = filename
        get_node(all_info.main_node).Save.popup()
        _end_id_selected()
    if id == 3 : 
        get_node(all_info.main_node).Load.popup()
        _end_id_selected()
    if id == 4: 
        _end_id_selected()
        get_tree().quit()


func _end_id_selected():
    get_parent().get_parent().visible = false
    get_node("../../../../Container").lock1 = false


var my_popup = null
func _on_Fichier_pressed() -> void:
    
    get_node("../../../../Container").lock1 = true


func popup_mouse_exit():
    get_node("../../../../Container").lock1 = false
    get_node("../../../").visible = false
