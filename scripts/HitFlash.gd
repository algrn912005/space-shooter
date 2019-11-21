extends Sprite


func _ready():
    $Anim.play("fade_out")


func _on_Anim_animation_finished(anim_name):
    queue_free()
