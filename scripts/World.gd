extends Node2D


func _ready():
    Globals.world = self
    
func _process(delta):
    $Scoreboard/Score.text = str(Globals.score)
    
func _exit_tree():
    Globals.world = null


func _on_MenuButton_pressed():
    get_tree().change_scene("res://scenes/Title.tscn")


func _on_PlayerShip_tree_exited():
    $EnemySpawner/SpawnTimer.stop()
    $PowerupSpawner/SpawnTimer.stop()
    $GameOver/GameOverLabel/ShowGameOverAnim.play("show_game_over")


func _on_ShowGameOverAnim_animation_finished(anim_name):
    $GameOver/MenuButton.show()
