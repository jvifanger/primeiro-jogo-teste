extends Panel

@onready var pause_panel: Panel = %PausePanel

func _process(delta: float) -> void:
	var esc_pressed = Input.is_action_just_pressed("pause")
	if (esc_pressed == true):
		get_tree().paused = true
		pause_panel.show()
	


func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	pause_panel.hide()


func _on_menu_button_pressed() -> void:
	pass # Replace with function body.
