extends Node

var world = null
var score = 0


func add_child_to_world(inst) -> void:
    if world != null:
        world.add_child(inst)
