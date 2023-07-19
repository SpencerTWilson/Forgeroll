extends Node2D

signal correct()
#@export var correct: bool = false
@export var size: float

func _draw():
	draw_rect(Rect2(Vector2(-1, -1) * size / 2, Vector2(1, 1) * size), Color.HONEYDEW)
	modulate.a = 0.05
	
func select():
	for child in get_tree().get_nodes_in_group("zone"):
		child.deselect()
	modulate = Color.PALE_VIOLET_RED
	modulate.a = 0.05
	if false:
		emit_signal("correct")
	
func deselect():
	modulate = Color.WHITE
	modulate.a = 0.05
