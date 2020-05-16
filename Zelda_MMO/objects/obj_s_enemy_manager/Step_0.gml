/// @description Step event for enemy

// Recorrer enemigos
for (var i=0; i<ds_list_size(Enemies_List); i++)
{
	var enemy_list = Enemies_List[| i]	// Get enemy
	var targetX = 0;
	var targetY = 0;
	
	#region Debug
	//msg2("myid", enemy_list[| 0])
	//msg2("name", enemy_list[| 1])
	//msg2("level", enemy_list[| 2])
	msg2("xx", enemy_list[| 3])
	msg2("yy", enemy_list[| 4])
	//msg2("sprite", enemy_list[| 5])
	//msg2("xframe", enemy_list[| 6])
	//msg2("yframe", enemy_list[| 7])
	//msg2("damage", enemy_list[| 8])
	//msg2("animlength", enemy_list[| 9])
	msg2("state", enemy_list[| 10])
	msg2("dir", enemy_list[| 11])
	//msg2("spd", enemy_list[| 12])
	//msg2("patrolstartx", enemy_list[| 13])
	//msg2("patrolstarty", enemy_list[| 14])
	//msg2("patrolendx", enemy_list[| 15])
	//msg2("patrolendy", enemy_list[| 16])
	msg2("targetx", enemy_list[| 17])
	msg2("targety", enemy_list[| 18])
	#endregion
	
	// Hacer patrullar o perseguir a los player
	// Player agro -1 = no player found
	var player_agro = -1
	// Recorrer lista de players
	for (var k=0; k<ds_list_size(Players_List); k++)
	{
		var player_list = Players_List[| k]		// Get player
		
		// Get coordinates
		var _x = enemy_list[| ev.xx]
		var _y = enemy_list[| ev.yy]
		var _px = player_list[| pv.xx]
		var _py = player_list[| pv.yy]
		var _id = player_list[| pv.myid]
		
		if point_distance(_x, _y, _px, _py) <= 96 {
			enemy_list[| ev.targetx] = _px
			enemy_list[| ev.targety] = _py
			enemy_list[| ev.state] = "alert"
			player_agro = _id
			}
		else enemy_list[| ev.state] = choose("patrol_1", "patrol_2")
	}
	
	var xx = enemy_list[| ev.xx]
	var yy = enemy_list[| ev.yy]
	var state = enemy_list[| ev.state]
	var patrolEndX = enemy_list[| ev.patrolendx]
	var patrolEndY = enemy_list[| ev.patrolendy]
	var patrolStartX = enemy_list[| ev.patrolstarty]
	var patrolStartY = enemy_list[| ev.patrolstarty]
	
	switch(state){
	case "patrol_1":
			if(point_distance(xx,yy,patrolEndX,patrolEndY)>1){
				 enemy_list[| ev.targetx] = patrolEndX;
				 enemy_list[| ev.targety] = patrolEndY;
				 enemy_list[| ev.dir] = point_direction(xx,yy,targetX,targetY);
			}else{
				enemy_list[| ev.state] = "patrol_2";
			}
		if(player_agro){
			enemy_list[| ev.state] = "alert";
		}
		break;
	case "patrol_2": 
			if(point_distance(xx,yy,patrolStartX,patrolStartY)>1){
				 enemy_list[| ev.targetx] = patrolStartX;
				 enemy_list[| ev.targety] = patrolStartY;
				 enemy_list[| ev.dir] = point_direction(xx,yy,targetX,targetY);
			}else{
				enemy_list[| ev.state] = "patrol_1";
			}
		if(player_agro){
			enemy_list[| ev.state] = "alert";
		}
		break;
	case "alert":
		enemy_list[| ev.spd] = 1.5;
		if(!player_agro){
			enemy_list[| ev.state] = choose("patrol_1","patrol_2");
			enemy_list[| ev.spd] = 1;
		}
		if(player_agro){
		enemy_list[| ev.targetx] = _px;
		enemy_list[| ev.targety] = _py;
		enemy_list[| ev.dir] = point_direction(xx,yy,targetX,targetY);
		}
		break;
	}
	
	var spd = enemy_list[| ev.spd]
	var xx = enemy_list[| ev.xx]
	var yy = enemy_list[| ev.yy]
	var state = enemy_list[| ev.state]
	var dir = enemy_list[| ev.dir]
	
	// Move
	enemy_list[| ev.xx] = xx+lengthdir_x(spd, dir)
	enemy_list[| ev.yy] = yy+lengthdir_y(spd, dir)
}
