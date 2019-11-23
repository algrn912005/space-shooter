extends Sprite

signal player_hit


func _ready():
    pass


func _on_PlayerShip_health_change(health):
    frame = health
