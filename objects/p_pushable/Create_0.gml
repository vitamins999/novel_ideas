// Inherit the parent event
event_inherited();

hSpeed = 0;
vSpeed = 0;

playerLocation = -1;
insideView = false;
arrowID = instance_create_depth(x, y -15, -8999, obj_push_pull_arrow);