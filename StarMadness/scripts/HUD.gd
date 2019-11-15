extends CanvasLayer

func _on_armor_changed(armor):
	$spr_armor.frame = armor

func _on_menu_button_pressed():
	get_tree().change_scene("res://scenes/levels/stage_menu.tscn")
