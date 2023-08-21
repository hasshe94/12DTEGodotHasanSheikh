#extends Node
#
#onready var music: AudioStreamPlayer3D = $AudioStreamPlayer3D
#
#var music_tracks: Dictionary = {
#	"main": "res://Assets/MysteriousSuspensefulMusic2018-11-03_-_Dark_Fog_-_David_Fesliyan.mp3"
#}
#
#var music_db: float = 1.0
#var sound_db: float = 1.0
#
#func change_music_db(value: float):
#	music_db = linear2db(value)
#	music.volume_db = music_db
#
#func change_sound_db(value: float):
#	sound_db = linear2db(value)
#
#func _ready():
#	music.stream = preload(music_tracks["main"])
#	music.play()
#
##func play_sound_effect(sfx: String):
##    var sound: AudioStreamPlayer = AudioStreamPlayer.new()
##    sound.stream = preload(sound_effects[sfx])
##    add_child(sound)
##    sound.volume_db = sound_db
##    sound.play()
##    yield(sound,
