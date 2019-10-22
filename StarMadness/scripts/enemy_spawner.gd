extends Node2D

var enemyk_preload = preload("res://scenes/characters/EnemyK.tscn")

func spawn_enemy():
	randomize()
	
	var new_enemy = enemyk_preload.instance()
	
	var enemy_position = Vector2()
	enemy_position.x = rand_range(16, get_viewport_rect().size.y - 16)
	enemy_position.y = -16
	
	print(enemy_position)
	new_enemy.position = enemy_position
	
	add_child(new_enemy)

func _on_Timer_timeout():
	spawn_enemy()
	$Timer.start()
