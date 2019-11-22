extends Area2D

signal camera_shake_requested
signal health_change(health)

const LERP_NORMAL_VALUE := 0.15

const bullet: = preload("res://scenes/PlayerBullet.tscn")
const explosion_scene: = preload("res://scenes/Explosion.tscn")
const hitflash_scene: = preload("res://scenes/HitFlash.tscn")


export var shoot_timer: = 0.8
export var health: = 5
var can_shoot: = true

onready var view_size = get_viewport_rect().size
onready var ship_width = ($Sprite.texture.get_size().x * $Sprite.scale.x) / 2


func _ready() -> void:
    pass


func _process(delta: float) -> void:
    # Clamp ship position.x within game bounds
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


func set_health(new_health: int) -> void:
    health = new_health
    emit_signal("health_change", health)
    if health <= 0:
        emit_signal("camera_shake_requested")
        create_explosion()
        queue_free()
        
func create_explosion() -> void:
    var exp_instance = explosion_scene.instance()
    exp_instance.position = position
    Globals.add_child_to_world(exp_instance)


func fire_lasers() -> void:
    var left_cannon = $Cannons/Left.global_position
    var right_cannon = $Cannons/Right.global_position
    create_laser(left_cannon)
    create_laser(right_cannon)


func create_laser(pos: Vector2) -> void:
    var laser = bullet.instance()
    laser.position = pos
    Globals.add_child_to_world(laser)


func _on_ShootTimer_timeout() -> void:
    can_shoot = true


func create_flash() -> void:
    var flash: = hitflash_scene.instance()
    Globals.add_child_to_world(flash)


func _on_PlayerShip_area_entered(area: Area2D) -> void:
    if area.get_collision_layer_bit(3):  # Enemy bullet
        set_health(health - 1)
        create_flash()
        area.queue_free()
    if area.get_collision_layer_bit(2):  # Enemy ship
        create_flash()
        set_health(0)
