extends FileDialog


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    var exec_path = OS.get_executable_path()
    var pos = exec_path.find_last('/')
    var the_path = ""
    for i in range(pos): 
        the_path += exec_path[i]
    self.current_dir = the_path
    connect("file_selected",get_node(all_info.main_node),"_export")
