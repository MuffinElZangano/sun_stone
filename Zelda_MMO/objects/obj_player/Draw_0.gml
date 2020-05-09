/// @description Frame Drawing
var frame_size = 24;

draw_text(x+10, y, string(network_id))

//Switch anim_length depending on sprite
switch(sprite){
    case spr_hero_walk: anim_length = 7;  frame_size = 24;   break;
    case spr_hero_atk : anim_length = 9; frame_size = 48;   break;
}

if(state=="attack"){
    draw_sprite_part(spr_sword,0,floor(x_frame)*frame_size,
                frame_size*y_frame,
                frame_size,frame_size,x,y);
}
//Core sheet drawing
draw_sprite_part(sprite,x_frame,floor(x_frame)*frame_size,
                frame_size*y_frame,
                frame_size,frame_size,x,y);

///Animate when...
if(inputMagnitude!=0 || state="attack"){
    animating = true;
}else{
    animating = false;
}

