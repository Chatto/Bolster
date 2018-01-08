extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var time = (360*60)^3
var colorcycle = Color(0,0,0,0)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	
func _process(delta):
	get_node("o").rotate(Vector3(0,1,0), 1*time)
	get_node("o").rotate(Vector3(1,0,0), 1*time)
	get_node("e").rotate_y(time)
	get_node("a").rotate_y(time*time)
	get_node("i").rotate_y(time+1/time)
	get_node("u").rotate_y(time)
	time = sin(time)+time
	colorcycle = Color((get_node("u").get_rotation().y), (get_node("e").get_rotation().y),(get_node("a").get_rotation().y),(get_node("u").get_rotation().y))
	get_world().get_environment().fx_set_param(get_world().get_environment().FX_PARAM_AMBIENT_LIGHT_COLOR, colorcycle)