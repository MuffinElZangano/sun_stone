
/// @description Frame Drawing
var frame_size = 24;
var x_offset = 0;
var y_offset = 0;

//Switch anim_length depending on sprite
switch(sprite){
	//Anim length = Frame quantity -1;
	//Hero
	case spr_hero_walk: anim_length = 7;  frame_size = 24;							break;
	case spr_hero_atk : anim_length = 9;  frame_size = 48; x_offset=8; y_offset=8;  break;
	case spr_hero_jump: anim_length = 5;  frame_size = 24; x_offset=4;				break;
	//Heroine
	case spr_heroine_walk: anim_length = 7;  frame_size = 24; x_offset=4;						break;
	case spr_heroine_idle: frame_size = 24;  x_offset=4;										break;
	case spr_heroine_atk : anim_length = 9;  frame_size = 48; x_offset=14; y_offset=8;			break;
	//case spr_heroine_jump: anim_length = 5;  frame_size = 24; x_offset=4;					break;
}

//Frame update
if(x_frame-0.5 < anim_length){
	x_frame+= 0.5;
}else{
	x_frame = 0;
}

//Core sheet drawing
draw_sprite(spr_shadow,0,x,y+10);
draw_sprite_part(sprite,x_frame,floor(x_frame)*frame_size,
                (frame_size*y_frame),
                frame_size,frame_size,x-x_offset,y-y_offset-z);