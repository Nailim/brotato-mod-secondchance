class_name SCMainEventListener
extends Node


const SECONDCHANCE_LOG = "Nailim-SecondChance"

const MOD_NAME = "Nailim-SecondChance"
const CONFIG_NAME = "config_created_by_mod_options"


var ModsConfigInterface = null

var settings_dict = {}


func _ready():
	parse_default_settings()
	
	ModsConfigInterface = get_node_or_null("/root/ModLoader/dami-ModOptions/ModsConfigInterface")
	if ModsConfigInterface:
		ModLoaderLog.info("ModOptions Support", SECONDCHANCE_LOG)
	else:
		ModLoaderLog.info("No ModOptions Support", SECONDCHANCE_LOG)


func parse_default_settings()->void :
	var conf_schema = ModLoaderConfig.get_config_schema("Nailim-SecondChance")
	
	for prop in conf_schema["properties"]:
		settings_dict[prop] = conf_schema["properties"][prop]["default"]


func get_settings()->Dictionary :
	return settings_dict
