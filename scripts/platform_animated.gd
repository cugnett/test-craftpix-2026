@tool
class_name MovingPlatform extends Node2D

@onready var Sprite: Sprite2D = $PlatformAnimated/Sprite2D
@onready var ColliderPlatform: CollisionShape2D =  get_node("PlatformAnimated").get_node("CollisionShapePlatform") #$PlatformAnimated/CollisionShapePlatform
@onready var AnimationPlatform: AnimationPlayer = $PlatformAnimated/AnimationPlayer

@export var platformTexture: Texture2D
@export var scaleWidth: float = 1.0
@export var scaleHeight: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Sprite.texture = platformTexture
	Sprite.scale = Vector2(scaleWidth, scaleHeight)
	resizeColliderToSprite()
	if (!Engine.is_editor_hint()): # Do not play animation in editor
		AnimationPlatform.play("move")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# delete platform at the end of the animation
	if (!Engine.is_editor_hint()): # Do not play animation in editor
		if not AnimationPlatform.is_playing():
			print("platform deleted")
			queue_free()

func resizeColliderToSprite():
	if (Sprite.texture):
		var _spriteSize = Sprite.get_rect().size * Sprite.scale
		if(ColliderPlatform.shape is RectangleShape2D):
			print(_spriteSize)
			ColliderPlatform.shape.extents = _spriteSize /2
		#print("collider:" + str(ColliderPlatform.shape.extents))
		else:
			print("Unsupported collider shape!")
	else:
		print("Texture missing")
			
	
