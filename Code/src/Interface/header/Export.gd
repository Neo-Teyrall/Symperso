extends FileDialog

var main_node 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    var desk_path = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP)
    self.current_dir = desk_path
    self.connect("file_selected",get_node("/root/Node"),"_export")
    self.connect("file_selected",self,"set_current_rep")
    self.connect("file_selected",$"../Save","set_current_rep")
    self.connect("file_selected",$"../Load","set_current_rep")
    self.connect("about_to_show",self,"show")
    main_node = get_node(all_info.main_node)

func set_current_rep(dir :String):
    self.current_dir = all_info.set_current_rep(dir)
    

func show(): 
    print("file")
    print(main_node.onglets[main_node.current_onglet]["session"].Nom.get_data() + ".png")
    current_file = main_node.onglets[main_node.current_onglet]["session"].Nom.get_data() + ".png"
    print(current_file)
