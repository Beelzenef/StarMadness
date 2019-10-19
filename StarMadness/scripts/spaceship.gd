extends Area2D

func _ready():
	set_process(true)

func _process(delta):
	var motion = (get_global_mouse_position().x - position.x) * 0.1
	translate(Vector2(motion, 0))
	
	var view_size = get_viewport_rect().size
	var pos = position
	pos.x = clamp(pos.x, 16, view_size.x - 16)
	position = pos