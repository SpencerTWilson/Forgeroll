extends Panel

@onready var tween: Tween = get_tree().create_tween()

func _can_drop_data(at_position, data):
	return true

func _drop_data(at_position, data):
	tween.tween_property(data, "position", at_position, 0.2)
	#data.position = at_position
