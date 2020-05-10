/// @description Declare input

//Frame update
if(animating){
    if(x_frame < anim_length){
        x_frame+= 0.5;
    }else{
        x_frame = 0;
    }
}else{
    x_frame = anim_length;
}