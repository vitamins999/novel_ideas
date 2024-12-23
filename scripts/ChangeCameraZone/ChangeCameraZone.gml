function ChangeCameraZone(_layerToDeactivate, _layerToActivate){
	instance_activate_layer(_layerToActivate);
	instance_deactivate_layer(_layerToDeactivate);
}