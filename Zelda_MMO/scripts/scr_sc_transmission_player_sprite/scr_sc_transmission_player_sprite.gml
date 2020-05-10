/// @param read

var read = argument[0]

var network_command = 0

#region Read packets
if read
{
	var buffer = argument[1]
	var socket = argument[2]
	
		
	if client()
	{
		var spr_player =  buffer_read(Buffer, buffer_u16);
		var _network_id = buffer_read(Buffer, buffer_u16);
		with(obj_player_network){
			if(network_id == _network_id){
				sprite = spr_player;
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
				scr_sc_transmission_player_sprite(false, buffer, _socket2)
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
		buffer_write(Buffer, buffer_u16, sprite);
		buffer_write(Buffer, buffer_u16, network_id);
		network_send_packet(Socket, Buffer, buffer_tell(Buffer));
	}
	else
	{
		network_send_packet(argument[2],argument[1],6);
	}
}
#endregion