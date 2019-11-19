extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
    $Anim.play("fade_out")


func _on_Anim_animation_finished(anim_name):
    queue_free()
