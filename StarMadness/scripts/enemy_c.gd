extends "enemy.gd"

var laser_enemy_preload = preload("res://scenes/items/laser_enemy.tscn")

func _ready():
	var directions = [velocity.x, -velocity.x]
	velocity.x = directions[randi() % directions.size()]

func _process(delta):
	if position.x <= 16:
		velocity.x = abs(velocity.x)
	if position.x >= get_viewport_rect().size.x - 16:
		velocity.x = -abs(velocity.x)

func shoot():
	var laser_position = $cannon.global_position
	
	var new_laser = laser_enemy_preload.instance()
	new_laser.global_position = laser_position
	get_parent().add_child(new_laser)

func _on_Timer_timeout():
	shoot()
	$Timer.start()
