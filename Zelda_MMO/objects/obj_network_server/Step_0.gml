/// @description 
if keyboard_check_pressed(ord("S")) { Hosting = true network_create_server(network_socket_tcp, 8001, 50) }
if keyboard_check_pressed(ord("C")) instance_destroy()