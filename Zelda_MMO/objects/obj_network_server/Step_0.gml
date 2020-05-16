/// @description Create server or client
if keyboard_check_pressed(ord("8")) { 
	Hosting = true 
	network_create_server(network_socket_tcp, 8002, 50) 
	instance_destroy(obj_player)
	instance_create_depth(x, y, 0 , obj_s_enemy_manager)
	instance_create_depth(x, y, 0 , obj_s_player_manager)
	}
if keyboard_check_pressed(ord("9")) instance_destroy()