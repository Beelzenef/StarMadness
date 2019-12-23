extends Area2D

onready var laser_preload = preload("res://scenes/items/laser_spaceship.tscn")
onready var explosion_preload = preload("res://scenes/items/explosion.tscn")

export var armor = 4 setget set_armor

signal armor_changed
signal ammo_changed

var ammo = 20

func _ready():
	connect("armor_changed", get_node("../HUD"), "_on_armor_changed")
	connect("ammo_changed", get_node("../HUD"), "_on_ammo_changed")
	set_process(true)

func _process(delta):
	var motion = (get_global_mouse_position().x - position.x) * 0.1
	translate(Vector2(motion, 0))
	
	#if Input.is_action_just_pressed("ui_accept"):
	#	shoot()
	
	var view_size = get_viewport_rect().size
	var pos = position
	pos.x = clamp(pos.x, 16, view_size.x - 16)
	position = pos

func shoot():
	if ammo > 0:
		var cannon_left = $CannonLeft.global_position
		var cannon_right = $CannonRight.global_position
		
		create_laser(cannon_left)
		create_laser(cannon_right)
		
		ammo -= 1
		emit_signal("ammo_changed", ammo) 

func create_laser(initial_pos):
	var laser_created = laser_preload.instance()
	laser_created.global_position = initial_pos
	get_parent().add_child(laser_created)

func create_explosion():
	var explosion_created = explosion_preload.instance()
	explosion_created.global_position = position
	get_parent().add_child(explosion_created)

func set_armor(value):
	if value > 4:
		return
	
	armor = value
	
	emit_signal("armor_changed", armor) 
	
	if armor <= 0:
		game_over()

#func _on_ShootButton_pressed():
#	shoot()

func game_over():
	var explosion_pos = global_position
	create_explosion()
	queue_free()
	get_tree().get_root().get_node("World/HUD/menu_button").show()
	get_tree().get_root().get_node("World/enemy_spawner").generate_enemies = false

func increase_ammo():
	ammo += 5
	emit_signal("ammo_changed", ammo) 

func _on_ShootButton_mouse_entered():
	shoot()
