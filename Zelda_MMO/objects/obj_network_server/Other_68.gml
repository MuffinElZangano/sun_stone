/// @description 
var type_event = async_load[? "type"]

switch(type_event)
{   
	// Client connects to server
	case network_type_connect:
        var socket = async_load[? "socket"]
		socket_map[? string(socket)] = new SocketData(socket)
		show_debug_message("socket conectado: "+string(socket))
		new Packet(socket,false).add(socket_map[? string(socket)].netid).head("clientSetup").send_tcp();
		break
		
	// Client disconnects
	case network_type_disconnect:
		var socket = async_load[? "socket"]
		delete socket_map[? string(socket)]
		ds_map_delete(socket_map,string(socket));
		msg("disconnected " + string(socket))
		network_destroy(socket)
		break
	
	// Data Incoming
    case network_type_data:
        // Handle the data
        var buffer = async_load[? "buffer"]
        var socket = async_load[? "id"]
		
		handle_packet(buffer, socket)
        break
}