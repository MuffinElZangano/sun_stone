/// @param read
function scr_sc_tranmission_set_network_id() {

	var read = argument[0]

	var network_command = 2

#region Read packets
	if read
	{
		var buffer = argument[1]
		var socket = argument[2]
	
		if client()
		{
			var _network_id = buffer_read(buffer, buffer_u16)
			obj_player.network_id = _network_id
		}
		else
		{
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
		}
		else
		{
			var _socket2 = argument[1]
			var socket = argument[2]
		
			buffer_write(Buffer, buffer_u16, _socket2)
			network_send_packet(socket, Buffer, buffer_tell(Buffer))
		}
	}
#endregion


}
