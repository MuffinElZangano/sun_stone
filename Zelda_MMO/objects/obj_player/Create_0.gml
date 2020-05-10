/// @description Declare variables
x_frame = 0;
y_frame = 0;
sprite = spr_hero_walk;

spd = 2;
acceleration = 0.2;
moveX = 0;
moveY = 0;
inputDirection = 0;
inputMagnitude = 0;
state = "idle";
animating = false;
anim_length = 7;

network_id = -1;

knockX = 0;
knockY = 0;

//Input declare, placeholder
_down   = vk_down;
_up     = vk_up;
_right  = vk_right;
_left   = vk_left;
_attack = ord("X");