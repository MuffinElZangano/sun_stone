/// @param read
function scr_sc_transmission_player_z() {

	var read = argument[0]

	var network_command = 6

#region Read packets
	if read
	{
		var buffer = argument[1]
		var socket = argument[2]
	
		
		if client()
		{
			var _z		=  buffer_read(buffer, buffer_f32);
			var _network_id = buffer_read(buffer, buffer_u16);
			with(obj_player_network){
				if(network_id == _network_id){
					z = _z;
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
					scr_sc_transmission_player_z(false, buffer, _socket2)
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
			buffer_write(Buffer, buffer_f32, z);
			buffer_write(Buffer, buffer_u16, network_id);
			network_send_packet(Socket, Buffer, buffer_tell(Buffer));
		}
		else
		{
			network_send_packet(argument[2],argument[1],8);
		}
	}
#endregion


}
