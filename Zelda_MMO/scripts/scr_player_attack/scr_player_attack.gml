sprite = sprAtk;
scr_sc_transmission_player_sprite(false);
switch(y_frame){
	case 0: h=instance_create_layer(x+24,y,"Instances",obj_hitbox); h.creator_id=id; break;	//RIGHT
	case 1: h=instance_create_layer(x,y-16,"Instances",obj_hitbox); h.creator_id=id; break;	//UP
	case 2: h=instance_create_layer(x-24,y,"Instances",obj_hitbox); h.creator_id=id; break;	//LEFT
	case 3: h=instance_create_layer(x,y+28,"Instances",obj_hitbox); h.creator_id=id; break;	//DOWN
	}
if(x_frame >= anim_length){
	state="normal";
}