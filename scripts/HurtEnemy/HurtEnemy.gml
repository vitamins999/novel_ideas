function HurtEnemy(_enemy, _damage, _source, _knockback){
	
	with (_enemy)
	{
		if (state != ENEMY_STATE.DIE)
		{
			enemyHP -= _damage;
			flash = 1;
			
			// Hurt or dead?
			if (enemyHP <= 0)
			{
				state = ENEMY_STATE.DIE;
			}
			else
			{
				if (state != ENEMY_STATE.HURT) statePrevious = state;
				state = ENEMY_STATE.HURT;
			}
			
			image_index = 0;
			if (_knockback != 0)
			{
				var _knockDirection = point_direction(x, y, (_source).x, (_source).y);
				xTo = x - lengthdir_x(_knockback, _knockDirection);
				yTo = y - lengthdir_y(_knockback, _knockDirection);
			}
		}
	}
}