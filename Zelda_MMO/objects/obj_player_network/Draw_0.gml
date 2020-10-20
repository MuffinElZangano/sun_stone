/// @description Frame Drawing
var frame_size = 24;
var x_offset = 0;
var y_offset = 0;

draw_text(x+10, y-20, string(network_id))

draw_set_halign(fa_middle);
draw_set_colour(c_black);
draw_text(x+11, y-10, username);
draw_text(x+10, y-11, username);
draw_text(x+9, y-10, username);
draw_text(x+10, y-9, username);

draw_set_colour(c_white);
draw_text(x+10, y-10, username);

draw_set_halign(fa_left);

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

//Sword test
var sx_offset = 0; var sy_offset = 0;
switch(y_frame){
	case 0:	sx_offset = 4;  sy_offset = 8;  break; //RIGHT
	case 1: sx_offset = 14; sy_offset = 14; break; //UP
	case 2: sx_offset = 24; sy_offset = 8;  break; //LEFT
	case 3: sx_offset = 10; sy_offset = 8;  break; //DOWN
}
if(sprite == spr_hero_atk || sprite == spr_heroine_atk){
	draw_sprite_part(spr_sword,x_frame,floor(x_frame)*frame_size,
                (frame_size*y_frame),
                frame_size,frame_size,x-sx_offset,y-sy_offset-z);
}

//Core sheet drawing
draw_sprite_part(sprite,x_frame,floor(x_frame)*frame_size,
                (frame_size*y_frame),
                frame_size,frame_size,x-x_offset,y-y_offset-z);