extends AnimatedSprite

func _on_Player_animate(motion):
	if motion.y < 0:
		self.play("jump")
	elif motion.x > 0:
		self.flip_h = false
		self.play("walk")
	elif motion.x < 0:
		self.flip_h = true
		self.play("walk")
	else:
		self.play("idle")
