extends Node

const SECONDCHANCE_LOG = "Nailim-SecondChance"

const MOD_NAME = "Nailim-SecondChance"



func _init() -> void:
	ModLoaderLog.info("Init", SECONDCHANCE_LOG)
	
	var mod_dir = ModLoaderMod.get_unpacked_dir().plus_file(MOD_NAME)
	var ext_dir = mod_dir.plus_file("extensions")
	var trans_dir = mod_dir.plus_file("translations")
	
	
	# Add extensions
	ModLoaderMod.install_script_extension(ext_dir.plus_file("main.gd"))
	ModLoaderMod.install_script_extension(ext_dir.plus_file("singletons/run_data.gd"))
	ModLoaderMod.install_script_extension(ext_dir.plus_file("ui/menus/ingame/wave_cleared_label.gd"))
	
	ModLoaderMod.install_script_extension(ext_dir.plus_file("ui/menus/run/difficulty_selection/difficulty_selection.gd"))
	
	
#	# Add translations
	ModLoaderMod.add_translation(trans_dir.plus_file("mod.translations.en.translation"))
	ModLoaderMod.add_translation(trans_dir.plus_file("mod.translations.fr.translation"))
	ModLoaderMod.add_translation(trans_dir.plus_file("mod.translations.zh.translation"))
	ModLoaderMod.add_translation(trans_dir.plus_file("mod.translations.ja.translation"))
	ModLoaderMod.add_translation(trans_dir.plus_file("mod.translations.ko.translation"))
	ModLoaderMod.add_translation(trans_dir.plus_file("mod.translations.zh_TW.translation"))
	ModLoaderMod.add_translation(trans_dir.plus_file("mod.translations.ru.translation"))
	ModLoaderMod.add_translation(trans_dir.plus_file("mod.translations.pl.translation"))
	ModLoaderMod.add_translation(trans_dir.plus_file("mod.translations.es.translation"))
	ModLoaderMod.add_translation(trans_dir.plus_file("mod.translations.pt.translation"))
	ModLoaderMod.add_translation(trans_dir.plus_file("mod.translations.de.translation"))
	ModLoaderMod.add_translation(trans_dir.plus_file("mod.translations.tr.translation"))
	ModLoaderMod.add_translation(trans_dir.plus_file("mod.translations.it.translation"))


func _ready() -> void:
	var event_listener = preload("res://mods-unpacked/Nailim-SecondChance/mod_sc_main_event_listener.gd")
	event_listener = event_listener.new()
	event_listener.name = "SCMainEventListener"
	add_child(event_listener)
	
	ModLoaderLog.info("Ready", SECONDCHANCE_LOG)
