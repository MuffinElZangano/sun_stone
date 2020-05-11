
/// @description Frame Drawing
var frame_size = 24;
var offset = 0;

//Switch anim_length depending on sprite

switch(sprite){
	//Anim length = Frame quantity -1;
    case spr_hero_walk: anim_length = 7;  frame_size = 24;				break;
    case spr_hero_atk : anim_length = 9;  frame_size = 48; offset=8;    break;
}


//Core sheet drawing
draw_sprite_part(sprite,x_frame,floor(x_frame)*frame_size,
                frame_size*y_frame,
                frame_size,frame_size,x-offset,y-offset);