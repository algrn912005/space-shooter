extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
    Globals.world = self
    
func _exit_tree():
    Globals.world = null
