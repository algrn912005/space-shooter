extends Node2D

const enemy_kamikaze = preload("res://scenes/EnemyKamikaze.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
    randomize()


func spawn():
    var enemy_instance = enemy_kamikaze.instance()
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
    $SpawnTimer.wait_time = rand_range(1, 4)
    spawn()
