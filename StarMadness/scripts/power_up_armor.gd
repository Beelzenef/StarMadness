extends "res://scripts/power_up.gd"

func _on_power_up_area_entered(area):
	if area.is_in_group("spaceship"):
		area.armor += 1
		queue_free()