/// @description
type=0
globalvar Socket; Socket = network_create_socket(network_socket_tcp)

globalvar Buffer; Buffer = buffer_create(1, buffer_grow, 1)
globalvar Hosting; Hosting = false