extends Control

# TODO This could be revamped into a modular menu creation node, however it is 3am rn and I am NOT doing that

@export var debug : bool = false

@export var container_container : Container
@export var main_container : Container

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_menu_to_container(main_container)
	for child in main_container.get_children():
		if child is Button:
			child.connect("pressed", on_button_pressed.bind(child))
			if debug: print("Connected Pressed Signal: ", str(child))
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
	if debug: print("New Container: ", str(container))
