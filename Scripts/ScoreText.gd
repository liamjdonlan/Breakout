extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Your score was: " + str(ScoreTracker.previous_score) + "\nYour highest score is: " + str(ScoreTracker.highest_score)
