extends Spatial

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

#--------------- VARIABLES ----------------
#------ EDITABLES
export var MOUSE_SENSITIVITY: float  = 0.2

#------ REFERENCES
onready var player: KinematicBody = get_node("../../Player")

#--------------- FUNCTIONS ----------------
#------ BUILT IN

# gets called every time an input is processed
func _input(event):
	# do stuff if the mouse is being moved
	if event is InputEventMouseMotion:
		# rotate on X
		player.rotate_y(deg2rad(-1 * event.relative.x) * MOUSE_SENSITIVITY)
		
		#rotate on Y
		rotate_x(deg2rad(event.relative.y) * MOUSE_SENSITIVITY)

		# clamp the X rotation
		rotation.x = clamp(rotation.x, deg2rad(-90), deg2rad(90))
