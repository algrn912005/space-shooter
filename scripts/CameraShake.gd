extends Camera2D

"""
Adapting script from https://github.com/GDquest/2019-godot-kickstarter
MIT License

Copyright (c) 2019 GDquest

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"""

onready var timer : Timer = $ShakeTimer

export var amplitude : = 6.0
export var duration : = 0.8
export(float, EASE) var DAMP_EASING : = 1.0
export var shake : = false setget set_shake

var enabled : = true

func _ready() -> void:
    randomize()
    
    # Set the timer value
    if timer.wait_time != duration:
        timer.wait_time = duration
        
    set_process(false)
    self.duration = duration
    connect_to_shakers()


func _process(delta: float) -> void:
    var damping : = ease(timer.time_left / timer.wait_time, DAMP_EASING)
    offset = Vector2(
        rand_range(amplitude, -amplitude) * damping,
        rand_range(amplitude, -amplitude) * damping)


func _on_ShakeTimer_timeout() -> void:
    self.shake = false


func _on_camera_shake_requested() -> void:
    if not enabled:
        return
    self.shake = true



func set_shake(value: bool) -> void:
    shake = value
    set_process(shake)
    offset = Vector2()
    if shake:
        timer.start()


func connect_to_shakers() -> void:
    for camera_shaker in get_tree().get_nodes_in_group("camera_shaker"):
        camera_shaker.connect("camera_shake_requested", self, "_on_camera_shake_requested")
