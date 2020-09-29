/// @param read
function scr_sc_transmission_enemy_creation() {

	var read = argument[0]

	var network_command = 7

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
		
			with instance_create_layer(xx, yy, "Instances", obj_enemy_lizard)
			network_id = _network_id
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
			var xx = argument[1]
			var yy = argument[2]
			var network_id = argument[3]
			var socket = argument[4]
		
			buffer_write(Buffer, buffer_u16, xx)
			buffer_write(Buffer, buffer_u16, yy)
			buffer_write(Buffer, buffer_u16, network_id)
			network_send_packet(socket, Buffer, buffer_tell(Buffer))
		}
	}
#endregion


}
