sprite = sprWalk;
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

if(inputMagnitude=0 && z=0){
	sprite = sprIdle;
	x_frame = 0;
}

if(_input_atk && z=0){
	state = "attack";
	x_frame = 0; moveX=0; moveY=0;
}

var grav = 0.22;
if(z > 0){ //On air
	moveZ -= grav;
	z += moveZ;
	sprite = sprJump;
}else{
	z = 0;
	if(_input_jump){
	    moveZ = 3;
	    z = moveZ;
	}else{
	    moveZ = 0;
	}
}