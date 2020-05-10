var buff = argument0
var socket = argument1


var command = buffer_read(buff, buffer_u16)

switch command
{
	// Player creation
	case 0:	scr_sc_transmission_player_creation	(true, buff, socket) break
	// Player movement
	case 1: scr_sc_transmission_player_movement	(true, buff, socket) break
	// Servidor setea mi network id
	case 2:	scr_sc_tranmission_set_network_id	(true, buff, socket) break
}

