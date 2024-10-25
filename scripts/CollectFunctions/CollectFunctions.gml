function CollectHealth(_amount){
	global.playerHealth = min(global.playerHealthMax, global.playerHealth + _amount);
}

function CollectRubber(_amount){
	global.playerAmmo[ITEM.RUBBER] = min(global.playerAmmoMax[ITEM.RUBBER], global.playerAmmo[ITEM.RUBBER] + _amount);
}

function CollectSharpener(){
	instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_sharpener_active);
}