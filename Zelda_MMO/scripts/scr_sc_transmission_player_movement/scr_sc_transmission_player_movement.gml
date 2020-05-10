/// @param read

var read = argument[0]

var network_command = 1

#region Read packets
if read
{
	var buffer = argument[1]
	var socket = argument[2]
	
	if client()
	{
		var xx = buffer_read(buffer, buffer_u16)
		var yy = buffer_read(buffer, buffer_u16)
		var _network_id = buffer_read(buffer, buffer_u16)			
		with obj_player_network if network_id==_network_id { x=xx y=yy }
	}
	else
	{
		scr_sc_transmission_player_movement(false, buffer, socket)
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
		buffer_write(Buffer, buffer_u16, x)
		buffer_write(Buffer, buffer_u16, y)
		buffer_write(Buffer, buffer_u16, network_id)
		network_send_packet(Socket, Buffer, buffer_tell(Buffer))
	}
	else
	{
		var buff = argument[1]
		var socket = argument[2]
		
		for (var i=0; i<=ds_list_size(socket_list)-1; i++)
		{
			var _socket2 = socket_list[| i]
			if _socket2!=socket network_send_packet(_socket2, buff, 8)
		}
	}
}
#endregion