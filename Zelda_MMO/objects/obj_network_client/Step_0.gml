/// @description 
if keyboard_check_pressed(ord("8")) instance_destroy()
if keyboard_check_pressed(ord("9")) network_connect(Socket, get_string("IP Address", "localhost"), 8002)
if keyboard_check_pressed(ord("0")) {
	var pack = new Packet(Socket);
	pack.add("test");
	var ser = pack.serialize();
	ser.send();
}
	