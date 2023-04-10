extends Node

const SECONDCHANCE_LOG = "Nailim-SecondChance"

const MOD_DIR = "Nailim-SecondChance/"


var dir = ""
var ext_dir = ""
var trans_dir = ""


func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", SECONDCHANCE_LOG)
	
	dir = modLoader.UNPACKED_DIR + MOD_DIR
	ext_dir = dir + "extensions/"
	trans_dir = dir + "translations/"
	
	
	# Add extensions
	modLoader.install_script_extension(ext_dir + "main.gd")
	modLoader.install_script_extension(ext_dir + "singletons/run_data.gd")
	modLoader.install_script_extension(ext_dir + "ui/menus/ingame/wave_cleared_label.gd")
	
	modLoader.install_script_extension(ext_dir + "ui/menus/run/difficulty_selection/difficulty_selection.gd")
	
	
	# Add translations
	modLoader.add_translation_from_resource(trans_dir + "mod.translations.en.translation")
	modLoader.add_translation_from_resource(trans_dir + "mod.translations.fr.translation")
	modLoader.add_translation_from_resource(trans_dir + "mod.translations.zh.translation")
	modLoader.add_translation_from_resource(trans_dir + "mod.translations.ja.translation")
	modLoader.add_translation_from_resource(trans_dir + "mod.translations.ko.translation")
	modLoader.add_translation_from_resource(trans_dir + "mod.translations.zh_TW.translation")
	modLoader.add_translation_from_resource(trans_dir + "mod.translations.ru.translation")
	modLoader.add_translation_from_resource(trans_dir + "mod.translations.pl.translation")
	modLoader.add_translation_from_resource(trans_dir + "mod.translations.es.translation")
	modLoader.add_translation_from_resource(trans_dir + "mod.translations.pt.translation")
	modLoader.add_translation_from_resource(trans_dir + "mod.translations.de.translation")
	modLoader.add_translation_from_resource(trans_dir + "mod.translations.tr.translation")
	modLoader.add_translation_from_resource(trans_dir + "mod.translations.it.translation")


func _ready():
	ModLoaderUtils.log_info("Ready", SECONDCHANCE_LOG)
