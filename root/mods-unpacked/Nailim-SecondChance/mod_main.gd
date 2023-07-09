extends Node

const SECONDCHANCE_LOG = "Nailim-SecondChance"

const MOD_DIR = "Nailim-SecondChance/"


var dir = ""
var ext_dir = ""
var trans_dir = ""


func _init(_modLoader = ModLoader):
	ModLoaderLog.info("Init", SECONDCHANCE_LOG)
	
	dir = ModLoaderMod.get_unpacked_dir() + MOD_DIR
	ext_dir = dir + "extensions/"
	trans_dir = dir + "translations/"
	
	
	# Add extensions
	ModLoaderMod.install_script_extension(ext_dir + "main.gd")
	ModLoaderMod.install_script_extension(ext_dir + "singletons/run_data.gd")
	ModLoaderMod.install_script_extension(ext_dir + "ui/menus/ingame/wave_cleared_label.gd")
	
	ModLoaderMod.install_script_extension(ext_dir + "ui/menus/run/difficulty_selection/difficulty_selection.gd")
	
	
#	# Add translations
	ModLoaderMod.add_translation(trans_dir + "mod.translations.en.translation")
	ModLoaderMod.add_translation(trans_dir + "mod.translations.fr.translation")
	ModLoaderMod.add_translation(trans_dir + "mod.translations.zh.translation")
	ModLoaderMod.add_translation(trans_dir + "mod.translations.ja.translation")
	ModLoaderMod.add_translation(trans_dir + "mod.translations.ko.translation")
	ModLoaderMod.add_translation(trans_dir + "mod.translations.zh_TW.translation")
	ModLoaderMod.add_translation(trans_dir + "mod.translations.ru.translation")
	ModLoaderMod.add_translation(trans_dir + "mod.translations.pl.translation")
	ModLoaderMod.add_translation(trans_dir + "mod.translations.es.translation")
	ModLoaderMod.add_translation(trans_dir + "mod.translations.pt.translation")
	ModLoaderMod.add_translation(trans_dir + "mod.translations.de.translation")
	ModLoaderMod.add_translation(trans_dir + "mod.translations.tr.translation")
	ModLoaderMod.add_translation(trans_dir + "mod.translations.it.translation")


func _ready():
	var event_listener = preload("res://mods-unpacked/Nailim-SecondChance/mod_sc_main_event_listener.gd")
	event_listener = event_listener.new()
	event_listener.name = "SCMainEventListener"
	add_child(event_listener)
	
	ModLoaderLog.info("Ready", SECONDCHANCE_LOG)
