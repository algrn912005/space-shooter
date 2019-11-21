extends Area2D

const flare_scene := preload("res://scenes/BulletFlare.tscn")

export var velocity = Vector2()


func _ready() -> void:
    create_flare()


func _process(delta: float) -> void:
    translate(velocity * delta)
    

func create_flare(global: bool = false) -> void:
    var flare = flare_scene.instance()
    flare.position = get_position()
    if global:
        Globals.world.add_child(flare)
    else:
        $FlareContainer.add_child(flare)


func _on_VisibilityNotifier2D_screen_exited() -> void:
    queue_free()
