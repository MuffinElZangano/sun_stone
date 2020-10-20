function handle_packet(buffer,socket) {
	var pack = new SerializedPacket(buffer,socket).deserialize();
	var isclient = pack.is_client();
	show_debug_message("packet received from " + (isclient ? "client" : "server"));
	if(pack.header == "clientSetup" && !Hosting) {
		NetId = pack.data[0];
		Connected = true;
	}
	else if(pack.header == "playerUpdate") {
		update_client(pack,socket);
		if(Hosting) {
			send_all(buffer, socket);	
		}
	}
	else {
		show_debug_message(pack.header);
		for(var i = 0; i < array_length(pack.data); i++) {
			show_debug_message(pack.data[i]);	
		}
	}
}