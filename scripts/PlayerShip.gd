extends Area2D

const LERP_NORMAL_VALUE = 0.2

const bullet = preload("res://scenes/PlayerBullet.tscn")


export var shoot_timer = 0.8
var can_shoot = true

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


func _process(delta):
    # Clamp ship position.x within game bounds
    var view_size = get_viewport_rect().size
    var ship_width = ($Sprite.texture.get_size().x * $Sprite.scale.x) / 2
    position.x = clamp(
        lerp(
            position.x,
            get_global_mouse_position().x,
            LERP_NORMAL_VALUE
        ), 
        0 + ship_width, 
        view_size.x - ship_width
    )
    
    if can_shoot:
        fire_lasers()
        can_shoot = false
        $ShootTimer.wait_time = shoot_timer
        $ShootTimer.start()
    

func fire_lasers():
    var left_cannon = $Cannons/Left.global_position
    var right_cannon = $Cannons/Right.global_position
    create_laser(left_cannon)
    create_laser(right_cannon)


func create_laser(pos):
    var laser = bullet.instance()
    laser.position = pos
    Globals.world.add_child(laser)


func _on_ShootTimer_timeout():
    can_shoot = true
