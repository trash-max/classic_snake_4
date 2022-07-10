extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var self_texture : Texture = G.get_texture("tail")
	if self_texture:
		$Sprite2D.set_texture(self_texture)
		$Sprite2D.set_offset(Vector2(24, 24))
		$Sprite2D.show()
	else:
		$ColorRect.set_color(Color.DARK_SLATE_BLUE)
		$ColorRect.show()
		


func  show_num(num):
	$Label.set_text(str(num))
