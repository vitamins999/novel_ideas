function DropItems(_x, _y, items){
	/// @desc DropItems(x, y, [items])
	/// @arg x
	/// @arg y
	/// @arg [items] array of items to drop
	
	// Choose function on items (so random choice of drops only happens on enemy death.
	var _randomIndex = irandom(array_length(items) - 1);
	var _randomItem = items[_randomIndex];
	show_debug_message(_randomIndex);
	var _items = array_length(_randomItem);
	
	if (_items > 1)
	{
		var _anglePerItem = 360 / _items;
		var _angle = random(360);
		for (var i = 0; i < _items; i++)
		{
			with (instance_create_layer(_x, _y, "Instances", _randomItem[i]))
			{
				direction = _angle;
				spd = 0.75 + (_items* 0.1) + random(0.1);
			}
			_angle += _anglePerItem;
		}
		
	} else instance_create_layer(_x, _y, "Instances", _randomItem[0]);
}

function RemoveDropItems(items){
	//If health is full, loop through items array of arrays and replace health with empty array.
	if (global.playerHealth == global.playerHealthMax)
	{
		for (var i = 0; i < array_length(items); i++)
		{
			if (array_contains(items[i], obj_coffee_collect)) || (array_contains(items[i], obj_energy_drink_collect))
			{
				items[i] = [obj_no_item];
			}
		}
	}
	
	//If rubber is full, loop through items array of array and replace rubber with empty array.
	if (global.playerAmmo[ITEM.RUBBER] == global.playerAmmoMax[ITEM.RUBBER])
	{
		for (var i = 0; i < array_length(items); i++)
		{
			if (array_contains(items[i], obj_rubber_collect))
			{
				items[i] = [obj_no_item];
			}
		}
	}
	
	return items;
}

// Sharpener Checks
function IsRandomOddsTrue(_numerator, _denominator){
	var _randomNumber = irandom(_denominator - 1);
	var _isWithinThreshold = _randomNumber <= _numerator - 1;
	
	return _isWithinThreshold;
}

function IsDropReplacedBySharpener(items){
	if (IsRandomOddsTrue(10, 100))
	{
		return global.entityDropListSharpener;
	}
	else
	{
		return items;
	}
}