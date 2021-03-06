extends FileDialog

var main_node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    var exec_path = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP)
    self.current_dir = exec_path
    self.connect("file_selected",get_node("/root/Node"), "_save")
    self.connect("file_selected",self,"set_current_rep")
    self.connect("file_selected",$"../Export","set_current_rep")
    self.connect("file_selected",$"../Load","set_current_rep")
    self.connect("about_to_show",self,"show")
    main_node = get_node(all_info.main_node)

func set_current_rep(dir :String):
    self.current_dir = all_info.set_current_rep(dir)
    
func show(): 
    print("file")
    current_file = main_node.onglets[main_node.current_onglet]["session"].Nom.get_data() + ".symperso"
    print(current_file)
