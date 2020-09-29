/// @description Insert description
if(can_gethurt){
HP -= other.dmg;
hurt = true; flash = 1;
dmg_x = other.x; dmg_y = other.y;
audio_play_sound(snd_hurt,0,0);
}