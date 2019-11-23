extends Node

var world = null
# warning-ignore:unused_class_variable
var score = 0


func add_child_to_world(inst) -> void:
    if world != null:
        world.add_child(inst)
