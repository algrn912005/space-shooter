extends Node2D

export var transisition_duration: = 1.8
export var transition_type: = 1


func _ready():
    Globals.world = self
    $AudioPlayer/PlayerStart.play()
    $AudioPlayer/Music.play()
    
func _process(delta):
    $Scoreboard/Score.text = str(Globals.score)
    
func _exit_tree():
    Globals.world = null


func _on_MenuButton_pressed():
    Globals.store_high_score()
    get_tree().change_scene("res://scenes/Title.tscn")


func _on_PlayerShip_tree_exited():
    $EnemySpawner/SpawnTimer.stop()
    $PowerupSpawner/SpawnTimer.stop()
    $GameOver/GameOverLabel/ShowGameOverAnim.play("show_game_over")
    
    if $AudioPlayer/PlayerStart.playing:
        $AudioPlayer/PlayerStart.stop()
    fade_out_music($AudioPlayer/Music)
    $AudioPlayer/GameOver.play()
    Globals.process_high_score()


func _on_ShowGameOverAnim_animation_finished(anim_name):
    $GameOver/MenuButton.show()



func fade_out_music(player: AudioStreamPlayer) -> void:
    $AudioPlayer/AudioTweenOut.interpolate_property(
        player,
        "volume_db", 
        0, 
        -80, 
        transisition_duration, 
        transition_type, 
        Tween.EASE_IN,
        0
    )
    $AudioPlayer/AudioTweenOut.start()


func _on_AudioTweenOut_tween_completed(object, key):
    object.stop()
