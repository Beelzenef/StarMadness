extends Area2D

var velocity = Vector2(0, 200)

func _ready():
	set_process(true)

func _process(delta):
	translate(velocity * delta)
	
	if position.y >= get_viewport_rect().size.y + 10:
		queue_free()