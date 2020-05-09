sprite = spr_hero_walk;
if(_input_right || _input_left || _input_up || _input_down){
inputDirection = point_direction(0,0,(_input_right-_input_left),(_input_down-_input_up));
}
inputMagnitude = (_input_right-_input_left !=0) || (_input_down-_input_up != 0);

var hmove = lengthdir_x(inputMagnitude, inputDirection);
var vmove = lengthdir_y(inputMagnitude, inputDirection);
var decceleration = 0.8;

if (hmove!=0){
    moveX += (spd*hmove-moveX)*acceleration;
} else {
    moveX+=(spd*hmove-moveX)*decceleration;
}

if (vmove!=0){
    moveY += (spd*vmove-moveY)*acceleration;
} else {
    moveY+=(spd*vmove-moveY)*decceleration;
}

/*if(_input_atk){ //PLACEHOLDER
    x_frame = 0;
    state = "attack";
}
