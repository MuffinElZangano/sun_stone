/// @description Declare input
_input_down     = keyboard_check(_down);
_input_up       = keyboard_check(_up);
_input_left     = keyboard_check(_left);
_input_right    = keyboard_check(_right);
_input_atk      = keyboard_check_pressed(_attack);

///Frame managing
switch(inputDirection){
    case 0  : y_frame = 0; break; //Right - East
    case 90 : y_frame = 1; break; //Up    - North
    case 180: y_frame = 2; break; //Left  - West
    case 270: y_frame = 3; break; //Down  - South
}
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

scr_sc_transmission_player_xframe(false);
scr_sc_transmission_player_yframe(false);

///State management
switch(state){
    case "idle":    scr_player_idle(); break;
    case "attack":  scr_player_attack(); break;
}

Collision_check();

x+=moveX+knockX;
y+=moveY+knockY;

if client() scr_sc_transmission_player_movement(false)