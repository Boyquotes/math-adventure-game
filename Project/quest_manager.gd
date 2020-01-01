extends Node2D

# Members
var quest_active = false
var quest_title = ""
var quest_location_x  = 0
var quest_location_y = 0
var quest_difficulty = 0
var quest_questions = []

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
		generateQuestQuestions()
		for i in range(quest_questions.size()):
			print(quest_questions[i][0])
			print(quest_questions[i][1])
			print(quest_questions[i][2])
	
func generateQuestTitle():
	quest_title = "Defeat {Addition} {Troll}!"
	
func generateQuestDifficulty(player_level):
	quest_difficulty = rand_range(0.0, player_level+5.0)
	
func generateQuestQuestions():
	var num_qs = int(round(rand_range(3.0, 10.0)))
	print(num_qs)
	var n1 = 0
	var n2 = 0
	var ans = 0
	for i in range(num_qs):
		print("Looping...", i)
		n1 = int(round(rand_range(0.0, quest_difficulty + 5)))
		n2 = int(round(rand_range(0.0, quest_difficulty + 5)))
		ans = n1 + n2
		var q = [n1, n2, ans]
		quest_questions.append(q)