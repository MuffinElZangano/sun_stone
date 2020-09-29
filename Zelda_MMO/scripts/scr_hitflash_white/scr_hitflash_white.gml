///@description Flash the sprite with hitflash shader
///@arg sprite
///@arg x_offset
///@arg y_offset
///@arg frame_size
function scr_hitflash_white(argument0, argument1, argument2, argument3) {
	if(flash > 0){
	    flash -= 0.12;
	    shader_set(spr_flash);
	    shd_alpha = shader_get_uniform(spr_flash,"_alpha");
	    shader_set_uniform_f(shd_alpha, flash);
	    draw_sprite_part(argument0,x_frame,floor(x_frame)*argument3,
	                (argument3*y_frame),
	                argument3,argument3,x-argument1,y-argument2);
	    shader_reset();
	}


}
