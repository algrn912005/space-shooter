extends Area2D

var velocity: = Vector2(0, 200)


func _ready():
    pass


func _process(delta):
    translate(velocity * delta)
    
    if position.y > get_viewport_rect().size.y + 30:
        queue_free()


func _on_PowerupDoubleShoot_area_entered(area):
    area.double_shoot_powerup = true
    queue_free()
