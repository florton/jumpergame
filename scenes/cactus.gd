extends Area2D

var rng = RandomNumberGenerator.new()

var x_min = -1000
var x_max = 1000
var thrown = false

var direction = 1
var ydirection = 0
func init(x0, x1):
	x_min = x0
	x_max = x1

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	direction = 1 if rng.randf() > 0.5 else -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += direction
	position.y += ydirection
	if position.x < x_min and !thrown:
		direction = 1
	if position.x > x_max and !thrown:
		direction = -1
		pass

func _on_cactus_area_entered(area):
	if area.get_name()== "grabbox":
		direction=0
		
	if area.is_in_group("enemy") and thrown:
		area.queue_free()
		queue_free()
	pass # Replace with function body.

func _throw_up():
	thrown=true
	direction=0
	ydirection=-5
	
func _throw_down():
	thrown=true
	direction=0
	ydirection=5

func _throw_right():
	thrown=true
	direction=5
	ydirection=0

func _throw_left():
	thrown=true
	direction=-5
	ydirection=0

func _throw_upright():
	thrown=true
	direction=5
	ydirection=-5

func _throw_upleft():
	thrown=true
	direction=-1
	ydirection=-1
	
func _throw_downright():
	thrown=true
	direction=1
	ydirection=1
	
func _throw_downleft():
	thrown=true
	direction=-1
	ydirection=1
	
