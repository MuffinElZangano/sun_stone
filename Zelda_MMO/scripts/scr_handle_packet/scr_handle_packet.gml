var buff = argument0
var socket = argument1


var command = buffer_read(buff, buffer_u16)

switch command
{
	// Player creation
	case 0:	scr_sc_transmission_player_creation(true, buff, socket)	break
		
	// Player movement
	case 1:
		if server() for (var i=0; i<=ds_list_size(socket_list)-1; i++)
		{
			var _socket2 = socket_list[| i]
			if _socket2!=socket network_send_packet(_socket2, buff, 8)
		}
		else
		{
			var xx = buffer_read(buff, buffer_u16)
			var yy = buffer_read(buff, buffer_u16)
			var _network_id = buffer_read(buff, buffer_u16)			
			with obj_player_network if network_id==_network_id { x=xx y=yy }
		}
		break
		
	// Servidor setea mi network id
	case 2:	
		
		var _network_id = buffer_read(buff, buffer_u16)
		obj_player.network_id = _network_id
		break
}

