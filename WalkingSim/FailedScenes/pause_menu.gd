#extends Control
#
#var is_paused: bool = false
#
#func set_is_paused(value):
#	is_paused=value
#	get_tree().paused=is_paused
#	visible=is_paused
#
#func _unhandled_input(event):
#	if event.is_action_pressed("resume"):
#		is_paused=(!is_paused)
#
#
#
#func _on_resume_button_pressed():
#	set_is_paused(false)
#
#func _on_exit_button_pressed():
#	get_tree().quit
#
