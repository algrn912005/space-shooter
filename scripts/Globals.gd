extends Node

var world = null


func add_child_to_world(inst) -> void:
    if world != null:
        world.add_child(inst)
