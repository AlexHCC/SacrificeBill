extends Area2D

#Functions
func _on_Gate_body_entered(body):
	if body.is_in_group("Player"):
		#Play music
		$AudioStreamPlayer.play()
		body.moving = false
		yield(get_tree().create_timer(1.0), "timeout")
		
		#Change level
		Singleton.level += 1
		Singleton.deaths = 0
		if Singleton.level == 1:
			get_tree().change_scene("res://Scenes/Level2.tscn")
		elif Singleton.level == 2:
			get_tree().change_scene("res://Scenes/Level3.tscn")
		else:
			get_tree().change_scene("res://Scenes/WinScreen.tscn")
