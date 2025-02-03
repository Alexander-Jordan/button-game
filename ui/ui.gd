extends Control

@onready var label: Label = $Label

func _ready() -> void:
	GameManager.game_reset.connect(func(message: String):label.text = message)
	GameManager.game_failed.connect(func(message: String):label.text = message + '\n\nClick the button to try again.')
	GameManager.game_success.connect(func(message: String):label.text = message + '\n\nClick the button to try again.')
