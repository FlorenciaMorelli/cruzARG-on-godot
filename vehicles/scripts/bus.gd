extends RigidBody2D

#	Speed in pixels/sec
@export var speed = 200

enum DirectionOfMovement{
	RIGHT = 1,
	LEFT = -1
}

#	Direction of movement
@export var direction: DirectionOfMovement = DirectionOfMovement.RIGHT

enum Sprites {
	BUS1,
	BUS2,
	BUS3
}
#	Sprite choice
@export var sprite_choice: Sprites = Sprites.BUS1

#	Sprite Node for changing visual direction
@onready var sprite: Sprite2D = $Bus_Sprite2D

var textures: Array[Texture2D] = [
	preload("res://vehicles/sprites/bus1-right.png"),
	preload("res://vehicles/sprites/bus2-right.png"),
	preload("res://vehicles/sprites/bus3-right.png"),
	preload("res://vehicles/sprites/bus1-left.png"),
	preload("res://vehicles/sprites/bus2-left.png"),
	preload("res://vehicles/sprites/bus3-left.png")
	
]

# Lista de puntos de parada
var bus_stops: Array[Node] = []

# Estado del colectivo
var is_stopped: bool = false
@onready var stop_timer: Timer = $StopTimer
@onready var resume_timer: Timer = $ResumeTimer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("vehicles")
	update_sprite()
	set_collision_layer(2)  #	Scene is on layer 2
	set_collision_mask(1)  # Scene detects collisions with layer 1 (Player)
	contact_monitor = true
	max_contacts_reported = 1
	
	# Obtener nodos de paradas del grupo 'bus_stops'
	bus_stops = get_tree().get_nodes_in_group("bus_stops")
	stop_timer.start()  # Asegúrate de que se inicie en el momento correcto
	resume_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_stopped:
		linear_velocity = Vector2(speed * direction, 0)
	else:
		linear_velocity = Vector2.ZERO

func update_sprite() -> void:
	if direction == DirectionOfMovement.RIGHT :
		if sprite_choice == Sprites.BUS1 :
			sprite.texture = textures[0]
		elif sprite_choice == Sprites.BUS2 :
			sprite.texture = textures[1]
		elif sprite_choice == Sprites.BUS3 :
			sprite.texture = textures[2]
	elif direction == DirectionOfMovement.LEFT :
		if sprite_choice == Sprites.BUS1 :
			sprite.texture = textures[3]
		elif sprite_choice == Sprites.BUS2 :
			sprite.texture = textures[4]
		elif sprite_choice == Sprites.BUS3 :
			sprite.texture = textures[5]


# Revisar si el bus está cerca de una parada
func check_near_stop() -> bool:
	for stop in bus_stops:
		if global_position.distance_to(stop.global_position) < 50:  # Ajusta el rango según sea necesario
			return true
	return false

# Detenerse cuando el temporizador expira
func _on_StopTimer_timeout() -> void:
	if check_near_stop():  # Solo detenerse cerca de una parada
		is_stopped = true
		stop_timer.stop()
		resume_timer.start()  # Temporizador para reanudar el movimiento

# Reanudar movimiento cuando expira el temporizador
func _on_ResumeTimer_timeout() -> void:
	is_stopped = false
	stop_timer.start()  # Reinicia el ciclo de paradas


func _on_screen_exited() -> void:
	if direction == 1:
		global_position.x = get_parent().global_position.x
	elif direction == -1:
		global_position.x = get_viewport_rect().size.x


func _on_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		get_tree().change_scene_to_file("res://UI/scenes/game_over.tscn")
