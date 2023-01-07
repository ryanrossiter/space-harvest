extends TextureRect

const HP_UNIT_SIZE = 14
const STORAGE_MAX_HEIGHT = 59
onready var hp = $HP
onready var storage = $Storage

func _process(delta):
	hp.rect_min_size.y = PlayerStats.health * HP_UNIT_SIZE
	storage.rect_min_size.y = floor(PlayerStats.storage_used / PlayerStats.storage_capacity * STORAGE_MAX_HEIGHT)
