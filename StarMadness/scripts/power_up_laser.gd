extends "res://scripts/power_up.gd"

func _on_power_up_area_entered(area):
	if area.is_in_group("spaceship"):
		#$audio.play()
		area.increase_ammo()
		queue_free()
