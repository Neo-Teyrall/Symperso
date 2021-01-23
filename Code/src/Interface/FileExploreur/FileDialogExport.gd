extends FileDialog


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    var desk_path = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP)
    self.current_dir = desk_path
    connect("file_selected",get_node(all_info.main_node),"_export")
    self.connect("file_selected",self,"set_current_rep")
    self.connect("file_selected",$"../Save","set_current_rep")
    self.connect("file_selected",$"../Load","set_current_rep")

func set_current_rep(dir :String):
    self.current_dir = all_info.set_current_rep(dir)
