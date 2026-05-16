class_name AudioComponent
extends BaseComponent

# TODO Add ability to change volume, bus, and maybe Pitch
func play_audio(stream : AudioStream) -> void:
	var audio_player : AudioStreamPlayer = AudioStreamPlayer.new()
	audio_player.connect("finished", kill_audio.bind(audio_player))
	add_child(audio_player)
	audio_player.play()

# TODO Add ability to change volume, bus, unit size, and maybe Pitch
func play_audio_3d(stream : AudioStream, position : Vector3) -> void:
	var audio_player : AudioStreamPlayer3D = AudioStreamPlayer3D.new()
	audio_player.position = position
	audio_player.connect("finished", kill_audio_3d.bind(audio_player))
	add_child(audio_player)
	audio_player.play()

func kill_audio(player : AudioStreamPlayer) -> void:
	player.stop()
	player.queue_free()

func kill_audio_3d(player : AudioStreamPlayer3D) -> void:
	player.stop()
	player.queue_free()
