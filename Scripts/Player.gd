extends KinematicBody

#	The Oddity, a space adventure/ exploration game
# 	Copyright (C) 2022 Chaotica Interactive

# 	This program is free software: you can redistribute it and/or modify
# 	it under the terms of the GNU Affero General Public License as published
# 	by the Free Software Foundation, either version 3 of the License, or
# 	(at your option) any later version.

# 	This program is distributed in the hope that it will be useful,
# 	but WITHOUT ANY WARRANTY; without even the implied warranty of
# 	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# 	GNU Affero General Public License for more details.

# 	You should have received a copy of the GNU Affero General Public License
# 	along with this program.  If not, see <https://www.gnu.org/licenses/>.

class_name player

#--------------- VARIABLES ----------------
#------ EDITABLES
export var WALK_SPEED: float = 4.0
export var RUN_SPEED: float = 6.0
export var CROUCH_SPEED: float = 1.5

export var JUMP_FORCE: float = 5.0

export var GRAVITY_ACCELERATION: float  = 12.8

export var MAX_SLOPE_ANGLE: float = 45.0

#------ VALUES
var input_move: Vector3 = Vector3()
var gravity_local: Vector3 = Vector3()
var snap_vector: Vector3 = Vector3()

export var is_running: bool = false
export var is_crouching: bool = false

export (int, 0, 200) var push = 1
#------ REFERENCES
onready var player_model: MeshInstance = $"Collider/Player Model"

onready var collider: CollisionShape = $"Collider"
onready var crouch_collider: CollisionShape = $"crouch collide"

onready var cieling_detector: RayCast = $"crouch collide/cieling detector"
#--------------- FUNCTIONS ----------------
#------ BUILT IN

# gets called when the player is loaded
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) #make it so the curor turns invisible and gets captured in the window (press F8 to stop the game without the mouse)

	player_model.visible = false #make the playermodel invisible when the game is actually playing as to not obstruct the players view


# gets called every physics frame
func _physics_process(delta):
	#--- WASD MOVEMENT
	# the player is running if the spring button is pressed, otherwise, they arent
	is_running = true if Input.is_action_pressed("sprint") else false
	# if the player is not running then use normal walk speed, otherwise set it to running if player is not crouching, if they are, set it to crouching speed
	input_move = (
		get_input_direction() * WALK_SPEED if not is_running and not is_crouching else get_input_direction() * RUN_SPEED if not is_crouching else get_input_direction() * CROUCH_SPEED
	)

	#--- GRAVITY
	# make gravity work if the player is not on the floor, else do nothing
	if not is_on_floor():
		gravity_local += GRAVITY_ACCELERATION * Vector3.DOWN * delta
	else:
		gravity_local = Vector3.ZERO
	
	# handle snap values
	snap_vector = Vector3.DOWN
	if is_on_floor():
		snap_vector = -get_floor_normal()# if we are in the air, point towards the closest floor
	
	#--- JUMPING
	if Input.is_action_just_pressed("jump") and is_on_floor() and not cieling_detector.is_colliding():
		snap_vector = Vector3.ZERO# dissable slope snapping
		gravity_local = Vector3.UP * JUMP_FORCE# apply the jump force
	
	#--- CROUCHING
	cieling_detector.force_raycast_update()

	if Input.is_action_pressed("crouch"):
		is_crouching = true
	elif cieling_detector.is_colliding():
		is_crouching = true
	else:
		is_crouching = false

	collider.disabled = is_crouching
	crouch_collider.disabled = not is_crouching

	#--- MOVE PLAYER
	input_move = move_and_slide_with_snap(input_move + gravity_local, snap_vector, Vector3.UP, true, 4, deg2rad(MAX_SLOPE_ANGLE), false)

	#--- shove objects around when you collide with them
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("bodies"):
			collision.collider.apply_central_impulse(-collision.normal * push)

#------ SELF WRITTEN

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
