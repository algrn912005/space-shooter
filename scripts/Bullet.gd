extends Area2D

const flare_scene = preload("res://scenes/BulletFlare.tscn")

export var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
    create_flare()
    pass # Replace with function body.


func _process(delta):
    translate(velocity * delta)
    

func create_flare():
    var flare = flare_scene.instance()
    flare.position = get_position()
    Globals.world.add_child(flare)


func _on_VisibilityNotifier2D_screen_exited():
    queue_free()
