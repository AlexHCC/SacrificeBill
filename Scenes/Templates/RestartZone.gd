extends Area2D

#Functions
func _on_RestartZone_body_entered(body):
	if body.is_in_group("Player"):
		body.position = Vector2.ZERO
		$AudioStreamPlayer.play()
		Singleton.deaths += 1
