extends Node

class_name LevelBase

@export var levelMusic: AudioStream = null

var level_color_rect = ColorRect
var jump_effect = preload("res://Scenes/Player/jump_effect.tscn")

@onready var level_audio_stream: AudioStream = AudioStream.new()

func _init():
	create_level_nodes()
	
func _ready():
	var tween = create_tween().set_ease(Tween.EASE_OUT_IN)
	tween.tween_property(level_color_rect, "color", Color.BLACK, 1)
	
	## Setups the music!
	if (levelMusic != null):
		level_audio_stream.stream = levelMusic
		level_audio_stream.play()

func create_level_nodes(): 
	level_color_rect = ColorRect.new()
	add_child(jump_effect.instantiate())
	
