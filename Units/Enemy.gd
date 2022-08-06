tool
class_name Enemy
extends Unit

var _astar := AStar2D.new()

onready var _unit_path = $UnitPath

func _ready() -> void:
	set_process(false)

	self.cell = grid.calculate_grid_coordinates(position)
	position = grid.calculate_map_position(cell)

	# We create the curve resource here because creating it in the editor prevents us from
	# moving the unit.
	if not Engine.editor_hint:
		curve = Curve2D.new()

func move() -> void:
	var current_path = PoolVector2Array([self.cell,Vector2(self.cell.x + self.move_range, self.cell.y)])
	self.walk_along(current_path)
