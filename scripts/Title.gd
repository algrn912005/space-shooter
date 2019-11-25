extends CanvasLayer


func _ready():
    Globals.load_high_scores()
    $ShowTitleAnim.play("show_title")


func _on_StartButton_pressed():
# warning-ignore:return_value_discarded
    get_tree().change_scene("res://scenes/World.tscn")


func _on_QuitButton_pressed():
    Globals.store_high_score()
    get_tree().quit()


func _on_RepeatTitleAnim_timeout():
    $ShowTitleAnim.play("show_title")
