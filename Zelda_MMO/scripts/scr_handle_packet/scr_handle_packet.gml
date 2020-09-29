function scr_handle_packet(argument0, argument1) {
	var buff = argument0
	var socket = argument1

	var command = buffer_read(buff, buffer_u16)

	switch command
	{
		// Player creation
		case 0:	scr_sc_transmission_player_creation	(true, buff, socket) break;
		// Player movement
		case 1: scr_sc_transmission_player_movement	(true, buff, socket) break;
		// Servidor setea mi network id
		case 2:	scr_sc_tranmission_set_network_id	(true, buff, socket) break;
		// Player animation Section
			// Player sprite
		case 3: scr_sc_transmission_player_sprite	(true, buff, socket) break;
			// Player x_frame
		case 4: scr_sc_transmission_player_xframe	(true, buff, socket) break;
			// Player y_frame
		case 5: scr_sc_transmission_player_yframe	(true, buff, socket) break;
			// Player z_frame
		case 6: scr_sc_transmission_player_z		(true, buff, socket) break;
		// Enemy creation
		case 7: scr_sc_transmission_enemy_creation	(true, buff, socket) break;
	}


}
