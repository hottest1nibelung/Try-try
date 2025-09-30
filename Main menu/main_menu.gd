extends Control


const EASE_LIGHT = 0.01
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var difference = get_global_mouse_position() - $PointLight2D.global_position
	$PointLight2D.global_position += difference * EASE_LIGHT


func _on_play_butt_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/harta_main.tscn")


func _on_exit_game_butt_pressed() -> void:
	get_tree().quit()
