extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var charcount = 0
var chars = []
var speed = OS.get_unix_time()
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	print(OS.get_unix_time())
	chars = get_children()
	var timechar = 360*chars.size()
	set_process(true)
	

func _process(delta):
	var i = 1
	for char in chars:
		var charrot = char.get_rotation().x + char.get_rotation().y + char.get_rotation().z
		char.rotate_x(speed)
		char.rotate_y(i*speed)
		char.rotate_z(sin(i*sin(delta))*speed)
		char.global_rotate(Vector3(1,sin(i/24),cos(i/24)),speed*delta)
		char.set_scale(Vector3(sin(char.get_rotation().x),sin(char.get_rotation().x),sin(char.get_rotation().x)))
		i = i + 1
	i = 1
	speed = sin(OS.get_unix_time())*0.0025