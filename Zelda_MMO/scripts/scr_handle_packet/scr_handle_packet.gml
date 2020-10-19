function handle_packet(buffer,socket) {
	show_debug_message("recieved");
	var ser = new SerializedPacket(buffer,socket);
	var pack = ser.deserialize();
	show_debug_message(pack.data[0]);
}
