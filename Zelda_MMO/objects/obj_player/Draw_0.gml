/// @description Frame Drawing
var frame_size = 24;
var x_offset = 0;
var y_offset = 0;
var anim_speed = 0.65;

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
	x_frame+= anim_speed;
}else{
	x_frame = 0;
}
draw_sprite(spr_shadow,0,x,y+10);
//Sword test
var sx_offset = 0; var sy_offset = 0;
switch(y_frame){
	case 0:	sx_offset = 4; sy_offset = 8; break; //RIGHT
	case 1: sx_offset = 14; sy_offset = 14; break; //UP
	case 2: sx_offset = 24; sy_offset = 8; break; //LEFT
	case 3: sx_offset = 10; sy_offset = 8; break; //DOWN
}
if(state="attack"){
draw_sprite_part(spr_sword,x_frame,floor(x_frame)*frame_size,
                (frame_size*y_frame),
                frame_size,frame_size,x-sx_offset,y-sy_offset-z);
}

//Core sheet drawing
draw_sprite_part(sprite,x_frame,floor(x_frame)*frame_size,
                (frame_size*y_frame),
                frame_size,frame_size,x-x_offset,y-y_offset-z);
				
scr_hitflash_red(sprite,x_offset,(y_offset+z),frame_size);

//PROBANDO CUSTOM COLORS
				/*
var c_cape = c_purple;
var c_hair = c_yellow;
				
draw_sprite_part_ext(spr_hero_walk_cape,x_frame,floor(x_frame)*frame_size,
                (frame_size*y_frame),
                frame_size,frame_size,x+24,y-y_offset-z,1,1,c_cape,1);
draw_sprite_part_ext(spr_hero_walk_hair,x_frame,floor(x_frame)*frame_size,
                (frame_size*y_frame),
                frame_size,frame_size,x+24,y-y_offset-z,1,1,c_hair,1);
draw_sprite_part(spr_hero_walk_misc,x_frame,floor(x_frame)*frame_size,
                (frame_size*y_frame),
                frame_size,frame_size,x+24,y-y_offset-z);
				
var c_cape2 = c_teal;
var c_hair2 = c_lime;
				
draw_sprite_part_ext(spr_hero_walk_cape,x_frame,floor(x_frame)*frame_size,
                (frame_size*y_frame),
                frame_size,frame_size,x+48,y-y_offset-z,1,1,c_cape2,1);
draw_sprite_part_ext(spr_hero_walk_hair,x_frame,floor(x_frame)*frame_size,
                (frame_size*y_frame),
                frame_size,frame_size,x+48,y-y_offset-z,1,1,c_hair2,1);
draw_sprite_part(spr_hero_walk_misc,x_frame,floor(x_frame)*frame_size,
                (frame_size*y_frame),
                frame_size,frame_size,x+48,y-y_offset-z);