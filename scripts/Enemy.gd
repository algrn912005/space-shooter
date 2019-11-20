extends Area2D

export var velocity = Vector2()


func _ready() -> void:
    pass


func _process(delta: float) -> void:
    move(delta)
    check_and_destroy()

        
func move(delta: float) -> void:
    translate(velocity * delta)
    
func check_and_destroy() -> void:
    # Checks if the sprite moves offscreen and deletes it if it does
    var sprite_size = $Sprite.texture.get_size().y * $Sprite.scale.y
    if position.y - (sprite_size / 2) >= get_viewport_rect().size.y:
        queue_free()
