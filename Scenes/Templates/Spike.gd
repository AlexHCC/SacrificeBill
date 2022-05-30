extends Area2D

#Variables
export var playerDead : PackedScene
export var spawnRadius := 10.0

#Functions
func _on_Spike_body_entered(body):
	if (not Singleton.entered) and body.is_in_group("Player"):
		Singleton.entered = true
		
		#Wait a bit
		yield(get_tree().create_timer(0.015), "timeout")
		
		#Place fake player
		var dead = playerDead.instance()
		get_parent().add_child(dead)
		#Handle case where multiple spikes trigger
		if body.position.length() > spawnRadius:
			dead.position = body.position
			Singleton.deaths += 1
		else:
			dead.queue_free()
		
		#Respawn player
		body.position = Vector2.ZERO
		Singleton.entered = false
		
		#Play sound effect
		$AudioStreamPlayer.play()
