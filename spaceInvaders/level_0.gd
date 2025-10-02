extends Node2D

@onready var counter: RichTextLabel = $UI/Counter
@onready var lives: RichTextLabel = $UI/Lives
var c = 30
var l = 3

func _ready() -> void:
	counter.visible = true
	lives.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	lives.text = "Lives: " + str(l)
	counter.text = "Meteors left to destroy: " + str(c)
	if c <= 0:
		print("done")
		get_tree().paused = true
	
	if l <= 0:
		print("lost")
		get_tree().paused = true

func laser_hit_enemy():
	c-=1

func lose_point():
	l-=1
