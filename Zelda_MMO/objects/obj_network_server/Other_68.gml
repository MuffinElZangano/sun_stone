/// @description 
var type_event = async_load[? "type"]

switch(type_event)
{   
	// Client connects to server
	case network_type_connect:
        var socket = async_load[? "socket"]
		show_debug_message("socket conectado: "+string(socket))
		ds_list_add(socket_list, socket)
		break
		
	// Client disconnects
	case network_type_disconnect:
		msg("disconnected" + string(async_load[? "socket"]))
		network_destroy(async_load[? "socket"])
		break
	
	// Data Incoming
    case network_type_data:
        // Handle the data
        var buffer = async_load[? "buffer"]
        var socket = async_load[? "id"]
		
		scr_handle_packet(buffer, socket)
		
		
        break
}