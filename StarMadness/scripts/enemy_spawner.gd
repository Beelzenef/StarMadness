extends Node2D

var enemies = [
 	preload("res://scenes/characters/enemy_k.tscn"),
	preload("res://scenes/characters/enemy_c.tscn")
]

var powerups = [
	preload("res://scenes/items/power_up_armor.tscn"),
	preload("res://scenes/items/power_up_laser.tscn")
]
var generate_enemies = true

func spawn_enemy():
	randomize()
	
	var new_enemy = enemies[randi() % enemies.size()].instance()
	
	var enemy_position = Vector2()
	enemy_position.x = rand_range(16, get_viewport_rect().size.x - 16)
	enemy_position.y = -16
	
	#print(enemy_position)
	new_enemy.position = enemy_position
	
	add_child(new_enemy)

func spawn_powerup():
	randomize()
	
	var new_powerup = powerups[randi() % powerups.size()].instance()
	
	var powerup_position = Vector2()
	powerup_position.x = rand_range(16, get_viewport_rect().size.x - 16)
	
	new_powerup.position = powerup_position
	
	add_child(new_powerup)

func _on_Timer_timeout():
	if generate_enemies:
		spawn_enemy()
		$enemies_timer.start()

func _on_powerup_timers_timeout():
	if generate_enemies:
		spawn_powerup()
		$powerups_timer.start() 
