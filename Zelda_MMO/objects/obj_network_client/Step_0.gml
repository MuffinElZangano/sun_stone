/// @description 
if keyboard_check_pressed(ord("8")) instance_destroy()
if keyboard_check_pressed(ord("9")) Connected = network_connect(Socket, Address, Port)
if keyboard_check_pressed(ord("0")) {
	new Packet(Socket,true).head("test").add("test 2").send_tcp();
}