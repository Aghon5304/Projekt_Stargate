extends HSlider




func _on_value_changed(value: float) -> void:
	GlobalWorldEnvironment.environment.adjustment_brightness = value
