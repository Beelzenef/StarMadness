extends Area2D

export var velocity = Vector2()

export var armor = 2 setget set_armor

func _ready():
	set_process(true)

func _process(delta):
	translate(velocity * delta)
	
	if (position.y - 10) >= get_viewport_rect().size.y:
		queue_free()

func set_armor(value):
	armor = value
	if armor <= 0:
		queue_free()
