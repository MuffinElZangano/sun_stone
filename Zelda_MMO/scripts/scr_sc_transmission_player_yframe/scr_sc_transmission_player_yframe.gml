/// @param read

var read = argument[0]

var network_command = 5

#region Read packets
if read
{
	var buffer = argument[1]
	var socket = argument[2]
	
		
	if client()
	{
		var Y_frame		=  buffer_read(buffer, buffer_u8);
		var _network_id = buffer_read(buffer, buffer_u16);
		with(obj_player_network){
			if(network_id == _network_id){
				y_frame = Y_frame;
			}
		}
	}
	else
	{
		for (var i=0; i<=ds_list_size(socket_list)-1; i++)
		{
			var _socket2 = socket_list[| i]
			if _socket2!=socket
			{
				scr_sc_transmission_player_yframe(false, buffer, _socket2)
			}
		}	
	}
}
#endregion

#region Send packets
else
{
	buffer_seek(Buffer, buffer_seek_start, 0)
	buffer_write(Buffer, buffer_u16, network_command)
	
	if client()
	{
		buffer_write(Buffer, buffer_u8, y_frame);
		buffer_write(Buffer, buffer_u16, network_id);
		network_send_packet(Socket, Buffer, buffer_tell(Buffer));
	}
	else
	{
		network_send_packet(argument[2],argument[1],5);
	}
}
#endregion