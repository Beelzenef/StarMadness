extends Area2D

export var velocity = Vector2()

export var armor = 2 setget set_armor

var flare_preload = preload("res://scenes/items/flare.tscn")
var explosion_preload = preload("res://scenes/items/explosion.tscn")

func _ready():
	set_process(true)

func _process(delta):
	translate(velocity * delta)
	
	if (position.y - 10) >= get_viewport_rect().size.y:
		queue_free()

func set_armor(value):
	armor = value
	if armor <= 0:
		create_explosion()

func _on_Enemy_area_entered(area):
	if area.is_in_group("spaceship"):
		area.armor -= 1
		#show_flare()
		create_explosion()

func show_flare():
	var new_flare = flare_preload.instance()
	new_flare.global_position = position
	
	get_parent().add_child(new_flare)

func create_explosion():
	var explosion_created = explosion_preload.instance()
	explosion_created.global_position = position
	get_parent().add_child(explosion_created)
	
	queue_free()