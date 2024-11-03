hSpeed = 0;
vSpeed = 0;
xTo = xstart;
yTo = ystart;
dir = 0;
timePassed = 0;
waitDuration = 1;
wait = 0;
wanderDistance = 5;
wanderSpeed = 0.1;

// Randomise sprite
randomNumber = choose(1,2,3,4);
switch (randomNumber)
{
	case 1:
		sprite_index = spr_aftershave_puff_1;
		break;
	case 2:
		sprite_index = spr_aftershave_puff_1;
		break;
	case 3:
		sprite_index = spr_aftershave_puff_2;
		break;
	case 4:
		sprite_index = spr_aftershave_puff_2;
		break;
	default:
		break;
}