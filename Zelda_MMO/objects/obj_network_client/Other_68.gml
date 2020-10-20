/// @description 
var type_event = async_load[? "type"]

switch(type_event)
{  
	// Data Incoming
    case network_type_data:
        // Handle the data
        var buffer = async_load[? "buffer"]
        var socket = async_load[? "id"]
		
		handle_packet(buffer, socket)
		
        break
}