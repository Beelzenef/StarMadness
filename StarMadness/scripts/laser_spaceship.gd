extends "laser.gd"

func _on_laser_area_entered(area):
	if area.is_in_group("enemy"):
		show_flare()
		area.armor -= 1
