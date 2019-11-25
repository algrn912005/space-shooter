extends "res://scripts/Enemy.gd"

const direction = [-1, 1]
const laser_scene = preload("res://scenes/EnemyBullet.tscn")

onready var sprite_scale = $Sprite.scale.x
onready var sprite_size = $Sprite.texture.get_size().x

func _ready():
    randomize()
    $CannonTimer.wait_time = rand_range(1, 2.5)
    velocity.x = direction[randi() % direction.size()] * velocity.x


func _process(delta: float) -> void:
    if position.x <= 0 + ((sprite_size * sprite_scale) / 2):
        velocity.x = abs(velocity.x)
    if position.x >= get_viewport_rect().size.x - ((sprite_size * sprite_scale) / 2):
        velocity.x = -velocity.x


func _on_CannonTimer_timeout() -> void:
    $AudioPlayer/LaserSound.play()
    var laser = laser_scene.instance()
    laser.position = $Cannon.global_position
    Globals.add_child_to_world(laser)
