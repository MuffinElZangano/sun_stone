/// @description 
if keyboard_check_pressed(ord("S")) instance_destroy()
if keyboard_check_pressed(ord("C")) network_connect(Socket, "200.104.94.141", 8001)
if keyboard_check_pressed(ord("D")) 
	scr_sc_transmission_player_creation(false)