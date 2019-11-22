extends Sprite

signal player_hit

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


func _on_PlayerShip_health_change(health):
    frame = health   
