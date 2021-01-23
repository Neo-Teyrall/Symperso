extends Node
class_name all_info

##############################################################################
###################  Chemin                               ####################
##############################################################################
const main_node = "/root/Node"
const charac_to_Sum = "../../Vi_Vo_Sum/sum"


const window_size = Vector2(450,945)
    
enum Carac{Agilitie  = 0,
           Astuce = 1 ,
           Discretion = 2,
           Force = 3,
           Persuasion = 4,
           Precision = 5,
           vigilance = 6
           Volonte = 7}

enum type{attaque = 0 ,
          defence = 1 ,
          neutre = 2 ,
          carac = 3}

enum val_carac{Novice = 1,
               Adepte = 2,
               Maitre = 3}

var moi : String = "A"

static func merge_path(p1 : String, p2 : String): 
    return p1 + "/" + p2


static func set_current_rep(dir :String):
    var pos = dir.find_last("/")
    var new_dir = ""
    for i in range(pos):
        new_dir += dir[i]
    return new_dir
