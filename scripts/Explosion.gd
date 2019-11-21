extends AnimatedSprite


func _ready():
    $Smoke.emitting = true
    $Flare.emitting = true
    playing = true
    $Anim.play("fade_out")


func _on_Explosion_animation_finished():
    queue_free()
