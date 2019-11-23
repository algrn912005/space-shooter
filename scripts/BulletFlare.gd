extends Sprite


func _ready() -> void:
    $Anim.play("fade_out")


# warning-ignore:unused_argument
func _on_Anim_animation_finished(anim_name: String) -> void:
    queue_free()
