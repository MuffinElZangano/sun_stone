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

//Animate when...
if(inputMagnitude!=0 || state="attack"){
    animating = true;
}else{
    animating = false;
}
