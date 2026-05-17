extends Control

@export var container_container : Container
@export var main_container : Container

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_menu_to_container(main_container)
	for child in main_container.get_children():
		if child is Button:
			child.connect("pressed", on_button_pressed.bind(child))
		else: push_warning("Incompatible node in MainContainer: ", child)

# Trying something new with main menu code, idk if I like it
func on_button_pressed(button : Button) -> void:
	match button.name:
		"HostButton":
			pass
		"JoinButton":
			pass
		"SettingsButton":
			pass
		"CreditsButton":
			pass
		"QuitButton":
			get_tree().quit()

func set_menu_to_container(container : Container) -> void:
	for child in container_container.get_children():
		if child is Container:
			child.hide()
	container.show()
