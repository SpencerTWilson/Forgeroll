extends Sprite2D

@export var current_dice: Dice

var selected = false
var rest_point
var rest_nodes = []

# Called when the node enters the scene tree for the first time.
func _ready():
	#Set up rest nodes
	rest_nodes = get_tree().get_nodes_in_group("zone")
	rest_point = rest_nodes[0].global_position
	rest_nodes[0].select()
	
	#make the dice look like the dice it is
	texture = current_dice.base_image

func _on_button_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("drag"):
		selected = true
		
	elif Input.is_action_just_pressed("roll"):
		roll_dice()

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
	else:
		global_position = lerp(global_position, rest_point, 10 * delta)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
			var shortest_dist = 75
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist:
					child.select()
					rest_point = child.global_position
					shortest_dist = distance

# When the dice is rolled we grab a random face from the pool 
# and returns it's callable after setting visuals
func roll_dice():
	#animate rolling
	_rolling_anim()
	
	#get random face
	var rolled_face: DiceFaces.DiceFaces = current_dice.sides.pick_random()
	
	#make our dice look right
	$Face.texture = load(DiceFaces.dice_face_dict[rolled_face][1])
	
	#Returns an array of the callable and the 
	#$"../.." current_dice.dice_face_dict[rolled_face][0]
	
# For animating the dice rolling, Shaders?
func _rolling_anim():
	pass
