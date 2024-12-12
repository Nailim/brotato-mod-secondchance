class_name SCMainEventListener
extends Node


const SECONDCHANCE_LOG = "Nailim-SecondChance"

const MOD_NAME = "Nailim-SecondChance"
const CONFIG_NAME = "config_created_by_mod_options"


var ModsConfigInterface = null

var config:ModConfig = null

var settings_dict:Dictionary = {}


func _ready():
	ModsConfigInterface = get_node_or_null("/root/ModLoader/dami-ModOptions/ModsConfigInterface")
	if not ModsConfigInterface:
		ModLoaderLog.info("No ModOptions Support", SECONDCHANCE_LOG)
		return
		
	ModLoaderLog.info("ModOptions Support", SECONDCHANCE_LOG)
	
	parse_default_settings()
	
	ModsConfigInterface.connect("setting_changed", self, "_on_setting_changed")
	
	load_settings()


func parse_default_settings()->void :
	var conf_schema = ModLoaderConfig.get_config_schema("Nailim-SecondChance")
	
	for prop in conf_schema["properties"]:
		settings_dict[prop] = conf_schema["properties"][prop]["default"]


func load_settings()->void :
	# load settings from saved config
	var configs = ModLoaderConfig.get_configs(MOD_NAME)
	if configs.has(CONFIG_NAME):
		config = ModLoaderConfig.get_config(MOD_NAME, CONFIG_NAME)
	else:
		config = ModLoaderConfig.create_config(MOD_NAME, CONFIG_NAME, settings_dict)
	
	if config:
		var _error_config = ModLoaderConfig.update_config(config)
		var data = config.data
		var need_update: = false
		for key in settings_dict.keys():
			if not data.has(key):
				data[key] = settings_dict[key]
				need_update = true
			settings_dict[key] = data[key]
		
		if need_update:
			config.data = data
			var _error_updated_config = ModLoaderConfig.update_config(config)
	
	
	# update values in mod menu to reflect loaded settings
	for key in settings_dict.keys():
		ModsConfigInterface.on_setting_changed(key, settings_dict[key], MOD_NAME)
	
	var settings = ModsConfigInterface.get_settings(MOD_NAME)
	
	if settings:
		for key in settings_dict.keys():
			settings_dict[key] = settings[key]


func _on_setting_changed(setting_name, value, mod_name)->void :
	if mod_name == MOD_NAME:
		settings_dict[setting_name] = value
		
		if config:
			config.data[setting_name] = value
			var _error_config = ModLoaderConfig.update_config(config)


func get_settings()->Dictionary :
	return settings_dict
