extends Node2D



func _ready():
    Globals.world = self
    
func _process(delta):
    $Scoreboard/Score.text = str(Globals.score)
    
func _exit_tree():
    Globals.world = null
