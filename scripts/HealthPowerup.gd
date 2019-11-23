extends "res://scripts/Powerup.gd"


func _ready():
    pass


func _on_HealthPowerup_area_entered(area):
    area.health += 1
    queue_free()
