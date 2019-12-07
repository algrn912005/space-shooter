extends Control


func _ready():
    pass


func _on_TextureButton_pressed():
    Globals.process_high_score($NameInput.text)
    Globals.store_high_score()
    get_tree().change_scene("res://scenes/Title.tscn")
