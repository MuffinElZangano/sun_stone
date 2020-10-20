function make_player_packet(socket,isClient, net_id,spr,p_x,p_y,p_z,f_x,f_y,username) {
	var pack = new Packet(socket,isClient);
	pack.add(net_id);
	pack.add(spr);
	pack.add(p_x).add(p_y).add(p_z);
	pack.add(f_x).add(f_y);
	pack.add(username);
	return pack;
}

function spawn_client(data, socket) {
	var inst = instance_create_layer(data[2],data[3],layer_get_id("Instances"),obj_player_network);
	inst.network_id = data[0];
	inst.sprite = data[1];
	inst.z = data[4];
	inst.x_frame = data[5];
	inst.y_frame = data[6];
	inst.username = data[7];
	return inst;
}

function update_client(pack, socket) {
	var inst = noone;
	var data = pack.data;
	if(instance_exists(obj_network_server)) {
		inst = socket_map[? string(socket)].object;
	}
	else {
		if(array_length(obj_network_client.players)) {
			inst = obj_network_client.players[data[0]];
		}
	}
	if(instance_exists(inst)) {
		inst.sprite = data[1];
		inst.x = data[2];
		inst.y = data[3];
		inst.z = data[4];
		inst.x_frame = data[5];
		inst.y_frame = data[6];
	}
	else if(!instance_exists(obj_network_server)) {
		obj_network_client.players[data[0]] = spawn_client(data,socket);
	}
	else {
		socket_map[? string(socket)].object = spawn_client(data,socket);
	}
}

function send_all(buffer, ignore) {
	if(ds_map_size(socket_map) <= 0) return;
	for(var i = ds_map_find_first(socket_map); i != ds_map_find_last(socket_map); i = ds_map_find_next(socket_map,i)) {
		msg("sent");
		var sock = socket_map[? i];
		if(sock.sock == ignore) continue;
		network_send_packet(sock.sock,buffer,buffer_tell(buffer));
	}
	if(socket_map[? ds_map_find_last(socket_map)].sock != ignore) {
		msg("sent");
		var sock = socket_map[? ds_map_find_last(socket_map)];
		network_send_packet(sock.sock,buffer,buffer_tell(buffer));
	}
}