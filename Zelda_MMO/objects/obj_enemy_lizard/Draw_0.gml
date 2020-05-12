/// @description Insert description
var frame_size = 48;
msg1(dir);
draw_set_alpha(0.3);
draw_circle_color(x+12,y+12,vision_radius,c_red,c_red,0)
draw_set_alpha(1);
//Core sheet drawing
draw_sprite_part(sprite_index,x_frame,floor(x_frame)*frame_size,
                frame_size*y_frame,
                frame_size,frame_size,x-8,y-8);