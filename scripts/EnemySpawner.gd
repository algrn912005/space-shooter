extends Node2D

# TODO: Add max number of each enemy type as keys in the dict
const enemies = {
    "enemy_kamikaze": preload("res://scenes/EnemyKamikaze.tscn"),
    "enemy_clever": preload("res://scenes/EnemyClever.tscn")
}


# Called when the node enters the scene tree for the first time.
func _ready():
    randomize()


func spawn() -> void:
    var enemy_type = enemies.keys()[randi() % enemies.size()]
    # Prevent more than 2 of any single kind of enemy
    var enemy_size = get_tree().get_nodes_in_group(enemy_type).size()
    if enemy_size >= 2:
        return

    var enemy_instance = enemies[enemy_type].instance()
    var pos = Vector2()
    var sprite_width = (  # Get sprite's width dynamically
        enemy_instance.get_node("Sprite").texture.get_size().x
        *
        enemy_instance.get_node("Sprite").scale.x
    ) / 2

    pos.x = rand_range(0 + sprite_width, get_viewport_rect().size.x - sprite_width)
    pos.y = 0 - sprite_width
    enemy_instance.position = pos
    
    $Container.add_child(enemy_instance)


func _on_Timer_timeout():
    $SpawnTimer.wait_time = rand_range(1, 3)
    spawn()
