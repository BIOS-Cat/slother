tool
class_name Enemy
extends Unit

onready var _unit_path = $UnitPath

func _ready() -> void:
	set_process(false)

	self.cell = grid.calculate_grid_coordinates(position)
	position = grid.calculate_map_position(cell)

	# We create the curve resource here because creating it in the editor prevents us from
	# moving the unit.
	if not Engine.editor_hint:
		curve = Curve2D.new()
	
	var destination = Vector2(3, 2) 
	
	_unit_path.initialize([Vector2(1,2), Vector2(2,2), destination])
	print("self cell")
	print(self.cell)
	_unit_path.draw(self.cell, destination)
