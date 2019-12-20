extends Sprite

var ammo = 20 setget set_ammo

func set_ammo(new_value):
	ammo = new_value
	$label_ammo.text = str(ammo)
