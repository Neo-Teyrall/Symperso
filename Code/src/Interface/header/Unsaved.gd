extends WindowDialog

var onglet_asked = null setget set_onglet_asked
var _id_asked = null
func set_onglet_asked(new_value ):
    _id_asked = new_value
    onglet_asked = get_node(all_info.main_node).onglets[_id_asked]["onglet"].name
    $VBoxContainer/RichTextLabel.text = ("l'onglet \"" + onglet_asked + "\" n'est pas sauvegarder vous vouler vraiment ferner sans sauvegarde. les modification serotn perdu.")
    self.popup()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    $VBoxContainer/HBoxContainer/Sauvegarder.connect("pressed", self,"sauvegarder")
    $VBoxContainer/HBoxContainer/Fermer.connect("pressed",self,"fermer")
    $VBoxContainer/HBoxContainer/Annuler.connect("pressed",self,"annuler")
    pass 
    
func sauvegarder():
    get_node(all_info.main_node).save_and_close(_id_asked)
    self.hide()
    pass
    
func annuler():
    self.hide()
    pass
    
func fermer():
    get_node(all_info.main_node)._delete_onglet(_id_asked)
    self.hide()
    pass

