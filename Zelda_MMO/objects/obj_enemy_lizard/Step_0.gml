/// @description Insert description
event_inherited();
depth=-y;

var targetX = 0;
var targetY = 0;
var player_agro = collision_circle(x+12,y+12,vision_radius,obj_player,0,1);

switch(state){
	case "patrol_1":
			if(point_distance(x,y,patrolEndX,patrolEndY)>1){
				 targetX = patrolEndX;
				 targetY = patrolEndY;
				 dir = point_direction(x,y,targetX,targetY);
			}else{
				state = "patrol_2";
			}
		if(player_agro){
			state = "alert";
		}
		break;
	case "patrol_2": 
			if(point_distance(x,y,patrolStartX,patrolStartY)>1){
				 targetX = patrolStartX;
				 targetY = patrolStartY;
				 dir = point_direction(x,y,targetX,targetY);
			}else{
				state = "patrol_1";
			}
		if(player_agro){
			state = "alert";
		}
		break;
	case "alert":
		spd = 1.5;
		if(!player_agro){
			state = choose("patrol_1","patrol_2");
			spd = 1;
		}
		if(player_agro){
		targetX = player_agro.x;
		targetY = player_agro.y;
		dir = point_direction(x,y,targetX,targetY);
		}
		break;
}

if((dir<=45 && dir>=0) || 
  (dir>=315 && dir<=360))	{y_frame = 0; anim_length = 1;}
if(dir<135 && dir>=45)		{y_frame = 1; anim_length = 3;}
if(dir<225 && dir>=135)		{y_frame = 2; anim_length = 1;}
if(dir<315 && dir>=225)		{y_frame = 3; anim_length = 3;}

//Frame update
if(x_frame-0.5 < anim_length){
	x_frame+= 0.2*spd;
}else{
	x_frame = 0;
}
/*switch(dir){
    case 0  :	y_frame = 0; anim_length = 1; break; //Right - East
    case 90 :	y_frame = 1; anim_length = 3; break; //Up    - North
    case 180:	y_frame = 2; anim_length = 1; break; //Left  - West
    case 270:	y_frame = 3; anim_length = 3; break; //Down  - South
}*/

mp_potential_step_object(targetX,targetY,spd,obj_solid);