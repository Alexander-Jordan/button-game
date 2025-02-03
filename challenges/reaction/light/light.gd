extends AnimatedSprite2D

@onready var timer: Timer = $Timer

var is_light_on: bool = true :
	set(l):
		if l == is_light_on:
			return
		is_light_on = l
		animation = 'on' if is_light_on else 'off'
var react_time_started: bool = false
var react_time: float = 0.0
var min_time: float = 1.0
var max_time: float = 10.0

func _ready() -> void:
	is_light_on = true
	
	GameManager.button_down.connect(func():
		if react_time_started:
			react_time_started = false
			var milliseconds: float = fmod(react_time, 1) * 1000
			var seconds: float = fmod(react_time, 60)
			var time_string: String = "%02d.%03d" % [seconds, milliseconds]
			GameManager.game_success.emit('Reaction time: {time_string} sec.'.format({'time_string': str(time_string)}))
			if timer.timeout.is_connected(timeout):
				timer.timeout.disconnect(timeout)
		else:
			is_light_on = !is_light_on
			if is_light_on:
				GameManager.game_failed.emit('You clicked too fast.')
				if timer.timeout.is_connected(timeout):
					timer.timeout.disconnect(timeout)
			else:
				GameManager.game_reset.emit('Click the button when the light lights up.')
				react_time = 0.0
				timer.start(randf_range(min_time, max_time))
				timer.timeout.connect(timeout)
	)

func timeout() -> void:
	is_light_on = true
	react_time_started = true

func _process(delta: float) -> void:
	if react_time_started:
		react_time += delta
