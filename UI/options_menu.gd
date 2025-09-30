extends CanvasLayer


@onready var MVSlider := $MVSlider
func _ready() -> void:
	$AudioStreamPlayer2D.volume_db = linear_to_db(MVSlider.value)
	$AudioStreamPlayer2D.finished.connect(_on_Audio_Finished)
	$AudioStreamPlayer2D.play(38)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mv_slider_value_changed(value: float) -> void:
	print(value)
	$AudioStreamPlayer2D.volume_db = linear_to_db(value)

func _on_Audio_Finished():
	print("Audio finished")
	$AudioStreamPlayer2D.play()
