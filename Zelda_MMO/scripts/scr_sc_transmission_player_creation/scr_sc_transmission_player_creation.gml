/// @param read

var read = argument[0]

var network_command = 0

#region Read packets
if read
{
	var buffer = argument[1]
	var socket = argument[2]
	
	var xx = buffer_read(buffer, buffer_u16)
	var yy = buffer_read(buffer, buffer_u16)
		
	if client()
	{
		var _network_id = buffer_read(buffer, buffer_u16)
		with instance_create_layer(xx, yy, "Instances", obj_player_network)
		network_id = _network_id
	}
	else
	{
		// Server reads
		for (var i=0; i<=ds_list_size(socket_list)-1; i++)
		{
			// Set player network id and create object on clients
			var _socket2 = socket_list[| i]
			if _socket2!=socket
			{
				scr_sc_transmission_player_creation(false, xx, yy, _socket2, socket)
			}
			else scr_sc_tranmission_set_network_id(false, _socket2, socket)
			
			// Create enemies for client
			var enemy_list = Enemies_List[| 0]
			var _net_id = enemy_list[| 0]
			var xx = enemy_list[| 1]
			var yy = enemy_list[| 2]
			
			scr_sc_transmission_enemy_creation(false, xx, yy, _net_id, socket)
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
		buffer_write(Buffer, buffer_u16, obj_player.x)
		buffer_write(Buffer, buffer_u16, obj_player.y)
		network_send_packet(Socket, Buffer, buffer_tell(Buffer))
	}
	else
	{
		var xx = argument[1]
		var yy = argument[2]
		var socket = argument[3]
		var _socket2 = argument[4]
		
		buffer_write(Buffer, buffer_u16, xx)
		buffer_write(Buffer, buffer_u16, yy)
		buffer_write(Buffer, buffer_u16, socket)
		network_send_packet(_socket2, Buffer, buffer_tell(Buffer))
	}
}
#endregion