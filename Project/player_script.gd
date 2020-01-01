extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var speed = 900
var velocity = Vector2()
export (int) var health = 100
export (int) var mana = 100
export (int) var level = 1
export (int) var skill_points = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1

	velocity = velocity.normalized() * speed
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	for i in get_slide_count(): 
		var collision = get_slide_collision(i)
		#print("Collided with: ", collision.collider.name)
		if collision.collider.name == "QuestStartPoint":
			if !quest_manager.getQuestActiveStatus():
				print("Collided with a Start Quest Node!")
				quest_manager.generateQuest(level)
				get_tree().change_scene("res://BattleScene.tscn")


