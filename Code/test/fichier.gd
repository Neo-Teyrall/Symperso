extends MenuButton


func _ready() -> void:
    get_popup().add_item("Export", 1)
    get_popup().add_item("Save",2)
    get_popup().add_item("Save as", 3)
    get_popup().add_item('load', 4)
    get_popup().add_item("Quit",5)
    self.get_popup().connect("id_pressed",self,"_action")
    self.get_popup().connect("mouse_exited",self,"popup_mouse_exit")


func _action(id):
    var filename = get_node(all_info.main_node).get_current_session().Nom.get_text()
    filename = filename.replace(" ","-")
    if id == 1:
        get_node(all_info.main_node).Export.current_file = (filename + ".png")
        get_node(all_info.main_node).Export.popup()
        #get_parent().get_parent().visible = false
        _end_id_selected()
    if id ==2 :
        get_node(all_info.main_node).try_save()
    if id == 3 :
       ask_save_path()
    if id == 4 : 
        get_node(all_info.main_node).Load.popup()
        _end_id_selected()
    if id == 5: 
        _end_id_selected()
        get_node(all_info.main_node).ask_quit()

func ask_save_path(): 
    var filename = get_node(all_info.main_node).get_current_session().Nom.get_text()
    filename = filename + ".symperso"
    get_node(all_info.main_node).Save.current_file = filename
    get_node(all_info.main_node).Save.popup()
    _end_id_selected()
    
func _end_id_selected():
#    get_parent().get_parent().visible = false
    get_node("../../../").lock1 = false

#
#var my_popup = null
func _on_Fichier_pressed() -> void:
    get_node("../../../").lock1 = true
#
#
func popup_mouse_exit():
    get_node("../../../").lock1 = false
    get_node("../../../").visible = false
