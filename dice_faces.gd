extends Node

#All dice faces in the same order they are in the dice_face_lambdas
enum DiceFaces {attack_basic, defense_basic, heal_basic}

#		DICE FACES
var dice_face_dict: Dictionary = {
	DiceFaces.attack_basic : [Callable(self, "attack_basic"), "res://Art/dice/faces/Basic_Attack.png"],
	DiceFaces.defense_basic : [Callable(self, "defense_basic"), "res://Art/dice/faces/Basic_Defense.png"],
	DiceFaces.heal_basic : [Callable(self, "heal_basic"), "res://Art/dice/faces/Basic_Heal.png"]
}



#		DICE FUNCTIONS
func attack_basic():
	basic_anim() #example on how to do the animations
	
func defense_basic():
	basic_anim() #example on how to do the animations
	
func heal_basic():
	basic_anim() #example on how to do the animations

#		DICE FACE ANIMS
func basic_anim():
	pass
	

