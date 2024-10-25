/// @description Drop fragments and items
if (entityFragmentCount > 0)
{
	fragmentArray = array_create(entityFragmentCount, entityFragment);
	DropItems(x, y, fragmentArray)
}

if (entityDropList != -1)
{
	newDropList = RemoveDropItems(entityDropList);
	DropItems(x, y, newDropList);
}