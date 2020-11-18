extends FileDialog


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    var dir = Directory.new()
    print("current dir ")
    print(dir.get_current_dir())
    var exec_path = OS.get_executable_path()
    var pos = exec_path.find_last('/')
    var the_path = ""
    for i in range(pos): 
        the_path += exec_path[i]
    self.current_dir = the_path + "/"
    print("load  " + the_path )
    self.current_path = the_path + "/"
    self.connect("file_selected",get_node("/root/Node"),"_load")
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#    pass
