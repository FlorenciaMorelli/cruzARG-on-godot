extends RigidBody2D

#	Speed in pixels/sec
@export var speed = 300
#	Direction of movement
@export var direction: int = 1 # 1 goes right, -1 goes left
#	Sprite Node for changing visual direction
@onready var sprite: Sprite2D = $Taxi_Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("vehicles")
	_update_sprite_direction()
	set_collision_layer(2)  #	Scene is on layer 2
	set_collision_mask(1)  # Scene detects collisions with layer 1 (Player)
	contact_monitor = true
	max_contacts_reported = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	linear_velocity = Vector2(speed * direction, 0)


func _update_sprite_direction() -> void:
	if direction == 1:
		sprite.flip_h = false # Dirección hacia la derecha
	elif direction == -1:
		sprite.flip_h = true # Dirección hacia la izquierda


func _on_screen_exited() -> void:
	if direction == 1:
		global_position.x = get_parent().global_position.x
	elif direction == -1:
		global_position.x = get_viewport_rect().size.x


func _on_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		get_tree().reload_current_scene()
		#get_tree().change_scene("pantalla de game over")
