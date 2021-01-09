extends WindowDialog

var onglet_asked = null setget set_onglet_asked

func set_onglet_asked(new_value : String):
    onglet_asked = new_value
    $VBoxContainer/RichTextLabel.text = ("l'onglet \"" + new_value + " \" n'est pas sauvegarder vous vouler vraiment ferner sans sauvegarde. les modification serotn perdu.")
    self.popup()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    $VBoxContainer/HBoxContainer/Sauvegarder.connect("pressed", self,"sauvegarder")
    $VBoxContainer/HBoxContainer/Fermer.connect("pressed",self,"fermer")
    $VBoxContainer/HBoxContainer/Annuler.connect("pressed",self,"annuler")
    pass 
    
func sauvegarder():
    get_node(all_info.main_node).save_and_close(onglet_asked)
    self.hide()
    pass
    
func annuler():
    self.hide()
    pass
    
func fermer():
    get_node(all_info.main_node)._delete_onglet(onglet_asked)
    self.hide()
    pass

