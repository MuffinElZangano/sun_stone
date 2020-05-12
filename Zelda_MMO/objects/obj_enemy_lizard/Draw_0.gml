/// @description Insert description
var frame_size = 48;
msg1(dir,0)
//Core sheet drawing
//Draw character
draw_sprite_part(spr_lizard,x_frame,floor(x_frame)*frame_size,
                frame_size*y_frame,
                frame_size,frame_size,x-8,y-8);
//Draw Sword
draw_sprite_part(spr_lizard,x_frame,floor(x_frame)*frame_size,
                frame_size*(y_frame+4),
                frame_size,frame_size,x-8,y-8);