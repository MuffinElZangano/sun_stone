/// @description Insert description
var pos = 12;
draw_sprite(spr_lifebar,0,pos,pos);
draw_sprite_part(spr_lifebar,1,0,0,HP+1,sprite_get_height(spr_lifebar),pos,pos);

var c = c_black;
draw_text_color(pos*2,pos-1,string(HP)+"/"+string(maxHP),c,c,c,c,1);
draw_text(pos*2,pos-2,string(HP)+"/"+string(maxHP));