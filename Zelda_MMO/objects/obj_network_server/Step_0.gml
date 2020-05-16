/// @description MA (Many actions)
if keyboard_check_pressed(ord("8")) { Hosting = true network_create_server(network_socket_tcp, 8002, 50) instance_destroy(obj_player) }
if keyboard_check_pressed(ord("9")) instance_destroy()

// Step event for enemy
scr_s_enemy_step_event()