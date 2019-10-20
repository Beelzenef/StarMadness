extends ParallaxBackground

export var velocity = Vector2()

func _ready():
	set_process(true)
	$ParallaxLayer.motion_mirroring = $ParallaxLayer/Sprite.texture.get_size().rotated(sprite.global_rotation)

func _process(delta):
	var scroll = Vector2(0,3) #Some default scrolling so there's always movement.
	scroll += velocity / 200
	scroll_offset += scroll
