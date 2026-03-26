extends Node

signal button_down
signal button_up
signal pressed
signal toggled(toggled_on: bool)
signal game_reset(message: String)
signal game_success(message: String)
signal game_failed(message: String)

func on_button_down() -> void:
	button_down.emit()

func on_button_up() -> void:
	button_up.emit()

func on_pressed() -> void:
	pressed.emit()

func on_toggled(toggled_on: bool) -> void:
	toggled.emit(toggled_on)

func on_game_reset(message: String) -> void:
	game_reset.emit(message)

func on_game_success(message: String) -> void:
	game_success.emit(message)

func on_game_failed(message: String) -> void:
	game_failed.emit(message)
