extends KinematicBody

class_name player

#--------------- VARIABLES ----------------
#------ EDITABLES
export var WALK_SPEED: float = 6.0

export var JUMP_FORCE: float = 3.0

export var GRAVITY_ACCELERATION: float  = 9.8

export var MOUSE_SENSITIVITY: float  = 0.2

#------ VALUES
var input_move: Vector3 = Vector3()
var gravity_local: Vector3 = Vector3()

#------ REFERENCES
onready var look_pivot: Spatial = $"look pivot"
onready var player_model: MeshInstance = $"Collider/Player Model"
#--------------- FUNCTIONS ----------------
# gets called when the player is loaded
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) #make it so the curor turns invisible and gets captured in the window (press F8 to stop the game without the mouse)

	player_model.visible = false #make the playermodel invisible when the game is actually playing as to not obstruct the players view

# gets called every time an input is processed
func _input(event):
	# do stuff if the mouse is being moved
	if event is InputEventMouseMotion:
		# rotate on X
		rotate_y(deg2rad(-1 * event.relative.x * MOUSE_SENSITIVITY))
		
		#rotate on Y
		look_pivot.rotate_x(deg2rad(event.relative.y) * MOUSE_SENSITIVITY)

		# clamp the X rotation
		look_pivot.rotation.x = clamp(look_pivot.rotation.x, deg2rad(-90), deg2rad(90))

# gets called every physics frame
func _physics_process(delta):
	input_move = get_input_direction() * WALK_SPEED

	#make gravity work if the player is not on the floor
	if not is_on_floor():
		gravity_local += GRAVITY_ACCELERATION * Vector3.DOWN * delta
	
	if Input.is_action_pressed("jump") and is_on_floor():
		gravity_local = Vector3.UP * JUMP_FORCE

	var _move = move_and_slide(input_move + gravity_local, Vector3.UP)

# grabs the current input direction
func get_input_direction() -> Vector3:
	var z: float = (
		Input.get_action_strength("forward") - Input.get_action_strength("backward") #grab the Y movement
	)
	var x:float = (
		Input.get_action_strength("left") - Input.get_action_strength("right") # grab the X movement
	)

	# gather info and convert it from player space to world space and normalise it
	return transform.basis.xform(Vector3(x, 0, z)).normalized()
