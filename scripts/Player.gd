extends KinematicBody

class_name player

#--------------- VARIABLES ----------------
# cam controls
export var MOUSE_SENSITIVITY : float = 1.0
const MAX_LOOK_ANGLE : float = 90.0
const MIN_LOOK_ANGLE : float = -90.0

# vectors
var mouseDelta : Vector2 = Vector2.ZERO

# player componants
onready var camera = get_node("Camera")

#--------------- FUNCTIONS ----------------
# gets called every time an input is made
func _input(event):
	# check if mouse moved
	if event is InputEventMouseMotion:
		mouseDelta = event.relative

# gets called every frame
func _process(delta):
	# rotate camera along X axis
	camera.rotation_degrees -= Vector3(rad2deg(mouseDelta.y),0,0) * MOUSE_SENSITIVITY * delta

	# now clamp the X rotation so the player cant do crazy ass acrobatics while standing still
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, MIN_LOOK_ANGLE, MAX_LOOK_ANGLE)

	# rotate the player themself along the Y axis
	rotation_degrees -= Vector3(0,rad2deg(mouseDelta.x),0) * MOUSE_SENSITIVITY * delta

	# reset mouse delta vector
	mouseDelta = Vector2.ZERO
