extends Node2D



func _ready():
    Globals.world = self
    
func _exit_tree():
    Globals.world = null
