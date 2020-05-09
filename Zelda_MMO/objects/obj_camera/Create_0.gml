/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
view_width=1920/6; view_height=1080/6;
window_scale = 3;
window_set_size(view_width*window_scale,view_height*window_scale);
alarm[0]=1;
display_set_gui_size(view_width,view_height);
surface_resize(application_surface,view_width*window_scale,view_height*window_scale);