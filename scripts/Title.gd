extends CanvasLayer


func _ready():
    var scores = Globals.load_high_scores()
    $ShowTitleAnim.play("show_title")
    set_scores(scores)
    $Highscores/Scores/ShowScores.play("ShowScore")


func _on_StartButton_pressed() -> void:
    # warning-ignore:return_value_discarded
    get_tree().change_scene("res://scenes/World.tscn")


func _on_QuitButton_pressed() -> void:
    get_tree().quit()


func _on_RepeatTitleAnim_timeout() -> void:
    $ShowTitleAnim.play("show_title")


func set_scores(scores: Array) -> void:
    # Sets the scores in the 'Scores' labal
    var text = ""
    for i in range(5):
        text += (
            str(i + 1) + ". " 
            + str(scores[i][0]) + " - " 
            + str(scores[i][1]) + "\n"
        )
        
    $Highscores/Scores.text = text
