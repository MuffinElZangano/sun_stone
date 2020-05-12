///@description Declare variables
x_frame = 0;
y_frame = 0;
sex = "Female";

z = 0;

if(sex=="Male"){
	sprWalk = spr_hero_walk;
	sprJump = spr_hero_jump;
	sprIdle = spr_hero_idle;
	sprAtk  = spr_hero_atk;
}

if(sex=="Female"){
	sprWalk = spr_heroine_walk;
	sprJump = spr_hero_jump;
	sprIdle = spr_heroine_idle;
	sprAtk  = spr_heroine_atk;
}

sprite = sprWalk;
spd = 2;
acceleration = 0.2;
moveX = 0;
moveY = 0;
moveZ = 0;
inputDirection = 0;
inputMagnitude = 0;
network_id = -1;
state = "normal";
anim_length = 7;
maxHP = 100;
HP = maxHP;

//myWeapon = instance_create_depth(x,y,depth,obj_weapon);
//myWeapon.myPlayer = id;

knockX = 0;
knockY = 0;

//Input declare, placeholder
_down   = vk_down;
_up     = vk_up;
_right  = vk_right;
_left   = vk_left;
_jump	= vk_space;
_attack = ord("X")