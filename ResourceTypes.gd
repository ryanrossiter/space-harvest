extends Node

enum ResourceType {
	IRON,
	TITANIUM,
	GOLD,
	URANIUM,
}

var RESOURCE_ATTRIBUTES = {
	ResourceType.IRON: {
		"label": "Iron",
		"index": 0,
		"color": Color(0.52, 0.4, 0.35),
	},
	ResourceType.TITANIUM: {
		"label": "Titanium",
		"index": 3,
		"color": Color(0.9, 0.9, 1.0),
	},
	ResourceType.GOLD: {
		"label": "Gold",
		"index": 6,
		"color": Color(1.0, 0.9, 0.0),
	},
	ResourceType.URANIUM: {
		"label": "Uranium",
		"index": 2,
		"color": Color(0.1, 0.9, 0.3),
	},
}

