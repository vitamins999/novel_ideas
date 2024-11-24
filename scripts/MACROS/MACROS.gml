#macro FRAME_RATE 60
#macro TILE_SIZE 16
#macro CARDINAL_DIR round(direction / 90)
#macro VIEW_SCREEN view_camera[0]

#macro RESOLUTION_W 240
#macro RESOLUTION_H 180

#macro TRANSITION_SPEED 0.02
#macro OUT 0
#macro IN 1
#macro CARRY_HEIGHT 13

enum ENEMY_STATE
{
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	DIE_RUBBER,
	RETREAT,
	WAIT
}

enum ITEM
{
	NONE,
	AFTERSHAVE,
	RUBBER,
	TYPE_COUNT
}

enum CONTROL
{
	PLAYER,
	RUBBER
}