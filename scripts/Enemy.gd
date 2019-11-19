extends Area2D

export var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


func _process(delta):
    translate(velocity * delta)
    
    var sprite_size = $Sprite.texture.get_size().y * $Sprite.scale.y
    if position.y - (sprite_size / 2) >= get_viewport_rect().size.y:
        queue_free()
