extends KinematicBody

class_name player

#--------------- VARIABLES ----------------
export var MOUSE_SENSITIVITY: float  = 0.2

onready var look_pivot: Spatial = $"look pivot"
onready var player_model: MeshInstance = $"Collider/Player Model"
#--------------- FUNCTIONS ----------------
# gets called when the player is loaded
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) #make it so the curor turns invisible and gets captured in the window (press F8 to stop the game without the mouse)

	player_model.visible = false #make the playermodel invisible when the game is actually playing as to not obstruct the players view

# gets called every time an input is processed
func _input(event):
	if event is InputEventMouseMotion:
		# rotate on X
		rotate_y(deg2rad(-1 * event.relative.x * MOUSE_SENSITIVITY))

		#rotate on Y
		look_pivot.rotate_x(deg2rad(event.relative.y) * MOUSE_SENSITIVITY)
