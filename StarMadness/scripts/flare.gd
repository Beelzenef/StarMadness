 extends Sprite

func _ready():
	$AnimationPlayer.play("fadeout")
	yield($AnimationPlayer, "animation_finished")
	queue_free()
	pass