extends Area2D

export var velocity = Vector2()

onready var flare_preload = preload("res://scenes/items/flare.tscn")

func _ready():
	set_process(true)
	show_flare()
	
	yield($VisibilityNotifier2D, "screen_exited")
	queue_free()

func _process(delta):
	translate(velocity * delta)
	

func show_flare():
	var new_flare = flare_preload.instance()
	new_flare.global_position = position
	
	get_parent().add_child(new_flare)