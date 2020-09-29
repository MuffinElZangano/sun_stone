function Collision_check() {
	//Collision check
	//Horizontal
	if(moveX+knockX!=0){ //If its moving
	    if (place_meeting(x+moveX+knockX,y,obj_solid)){
	        repeat(abs(moveX+knockX)){
	            if(!place_meeting(x+sign(moveX+knockX), y, obj_solid)){ x += sign(moveX+knockX);}
	                else { break;}
	        }
	        moveX = 0;
	        knockX = 0;
	    }
	}
	//Vertical
	if(moveY+knockY!=0){
	    if (place_meeting(x,y+moveY+knockY,obj_solid)){
	        repeat(abs(moveY+knockY)){
	            if(!place_meeting(x, y+sign(moveY+knockY), obj_solid)){ y += sign(moveY+knockY);}
	            else { break; }
	        }
	        moveY = 0;
	        knockY = 0;
	    }
	}



}
