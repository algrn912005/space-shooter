extends Node2D

# TODO: Add max number of each powerup type as keys in the dict
const powerups = {
    "powerup_health": preload("res://scenes/HealthPowerup.tscn"),
    "powerup_doubleshoot": preload("res://scenes/PowerupDoubleShoot.tscn")
}

var RANDOM_MIN = 1
var RANDOM_MAX = 3


func _ready():
    $SpawnTimer.wait_time = rand_range(RANDOM_MIN, RANDOM_MAX)
    $SpawnTimer.start()
    randomize()


func spawn() -> void:
    var powerup_type = powerups.keys()[randi() % powerups.size()]
    # Prevent more than 2 of any single kind of powerup
    var powerup_size = get_tree().get_nodes_in_group(powerup_type).size()
    if powerup_size >= 2:
        return

    var powerup_instance = powerups[powerup_type].instance()
    var pos = Vector2()
    var sprite_width = (  # Get sprite's width dynamically
        powerup_instance.get_node("Sprite").texture.get_size().x
        *
        powerup_instance.get_node("Sprite").scale.x
    ) / 2

    pos.x = rand_range(0 + sprite_width, get_viewport_rect().size.x - sprite_width)
    pos.y = 0 - sprite_width
    powerup_instance.position = pos
    
    $Container.add_child(powerup_instance)


func _on_SpawnTimer_timeout():
    $SpawnTimer.wait_time = rand_range(RANDOM_MIN, RANDOM_MAX)
    spawn()
