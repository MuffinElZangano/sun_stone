/// @description 
if keyboard_check_pressed(ord("O")) { Hosting = true network_create_server(network_socket_tcp, 8001, 50) instance_destroy(obj_player) }
if keyboard_check_pressed(ord("P")) instance_destroy()