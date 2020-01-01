extends Node2D

# Members
var quest_active = false
var quest_title = ""
var quest_location_x  = 0
var quest_location_y = 0
var quest_difficulty = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func getQuestActiveStatus():
	return quest_active

func generateQuest(player_level):
	if !quest_active:
		quest_active = true
		print("Start a new Quest...")
		generateQuestTitle()
		print(quest_title)
		generateQuestDifficulty(player_level)
		print("Difficulty: ", quest_difficulty)
	
func generateQuestTitle():
	quest_title = "Defeat {Addition} {Troll}!"
	
func generateQuestDifficulty(player_level):
	quest_difficulty = rand_range(0.0, player_level+5.0)