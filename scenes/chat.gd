extends Control

@onready var timer = $Timer
@onready var label:RichTextLabel = $CanvasLayer/RichTextLabel
var level1_text = ["Howdie, fellow farmer! Go to level 1"];
var final_text = [level1_text] #level1, level2, ...
var current_text = "Howdie, fellow farmer! Go to level 1"
var typing_speed = 0.07
var current_char
func _ready() -> void:
	start_wrtiting()

func start_wrtiting():
	current_char = 0
	label.clear()
	timer.wait_time = typing_speed
	timer.start()
		
func _on_timer_timeout() -> void:
	if current_char < current_text.length():
		label.append_text(current_text[current_char])
		current_char += 1
	else:
		timer.stop()
