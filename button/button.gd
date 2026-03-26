extends TextureButton

@export var button_click_audio: AudioStream
@export var button_released_audio: AudioStream

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	button_down.connect(func(): GameManager.on_button_down(); audio_stream_player.stream = button_click_audio; audio_stream_player.play())
	button_up.connect(func(): GameManager.on_button_up(); audio_stream_player.stream = button_released_audio; audio_stream_player.play())
	pressed.connect(func(): GameManager.on_pressed())
	toggled.connect(func(toggled_on: bool): GameManager.on_toggled(toggled_on))
