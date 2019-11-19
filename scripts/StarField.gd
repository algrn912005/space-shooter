extends Node2D

var scroll_y = 0


func _process(delta):
    scroll_y += 10
    $StarsLayer.scroll_offset.y = scroll_y
