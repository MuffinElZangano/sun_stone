/// @description Insert description
NineSliceBoxStretched(spr_box,x,y,x+width,y+height,index);
var c = c_black;
draw_text_color(((x+(x+width))/2)-string_width(_text)/2,((y+(y+height))/2)-string_height(_text)/2,_text,c,c,c,c,1);
draw_text(((x+(x+width))/2)-string_width(_text)/2,((y+(y+height))/2)-string_height(_text)/2,_text);
if(device_mouse_x_to_gui(0)<x+width and device_mouse_x_to_gui(0)>x
	and device_mouse_y_to_gui(0)>y and device_mouse_y_to_gui(0)<y+height){
	index = 2;
	if(mouse_check_button_released(mb_left)){
		script_execute(myScript);
	}
}else{
	index = 1;
}