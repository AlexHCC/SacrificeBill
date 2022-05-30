extends Control

#Functions
func _on_Button_button_up():
	$AudioStreamPlayer.play()
	yield(get_tree().create_timer(0.2), "timeout")
	get_tree().change_scene("res://Scenes/Level1.tscn")
