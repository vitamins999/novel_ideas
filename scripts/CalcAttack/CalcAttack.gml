function CalcAttack(_collisionMask){
	// Use attack hit box and check for hits
	mask_index = _collisionMask;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, p_entity, hitByAttackNow, false);
	if (hits > 0)
	{
		for (var i = 0; i < hits; i++)
		{
			// if this instance has not yet been hit by this attack, hit it!
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1)
			{
				ds_list_add(hitByAttack, hitID);
				with (hitID)
				{
					if (entityHitScript != -1)
					{
						script_execute(entityHitScript)
					}
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = spr_player;
}