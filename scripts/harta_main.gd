extends Node2D

@onready var nav: NavigationAgent2D = $NavigationRegion2D/Icon/NavigationAgent2D
@onready var player = $NavigationRegion2D/Icon
@onready var target = $NavigationRegion2D/Icon2
var path

func get_new_path():
	path = nav.get_next_path_position()
func _ready():
	nav.target_position = target.global_position
	get_new_path()
	print(path)
