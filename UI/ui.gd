extends Control

func _ready() -> void:
	$OptionsMenu.process_mode = Node.PROCESS_MODE_ALWAYS
	$OptionsMenu.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_options_butt_pressed() -> void:
	#show options and pause game
	get_tree().paused = true
	$OptionsMenu.visible = true


func _on_close_options_butt_pressed() -> void:
	#closes the options UI
	get_tree().paused = false
	$OptionsMenu.visible = false

	
