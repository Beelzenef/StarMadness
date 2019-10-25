extends Node2D

var enemies = [
 	preload("res://scenes/characters/enemy_k.tscn"),
	preload("res://scenes/characters/enemy_c.tscn")
]

func spawn_enemy():
	randomize()
	
	var new_enemy = enemies[randi() % enemies.size()].instance()
	
	var enemy_position = Vector2()
	enemy_position.x = rand_range(16, get_viewport_rect().size.x - 16)
	enemy_position.y = -16
	
	print(enemy_position)
	new_enemy.position = enemy_position
	
	add_child(new_enemy)

func _on_Timer_timeout():
	spawn_enemy()
	$Timer.start()
