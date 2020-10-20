///@description Declare variables

x_frame = 0;
y_frame = 0;
sex = "Male";
username = get_string("Username?","");

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
h = noone
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

//Hurting
flash = 0; //Sprite flash when hurt
can_gethurt = true;
knockdir = 0;
hurt_delay = 5;
hurt = false;
knockX = 0;
knockY = 0;

//Input declare, placeholder
_down   = ord("S"); //vk_down
_up     = ord("W"); //vk_up
_right  = ord("D"); //vk_right
_left   = ord("A"); //vk_left
_jump	= vk_space;
_click_atk = mb_left;
_key_attack = ord("X");