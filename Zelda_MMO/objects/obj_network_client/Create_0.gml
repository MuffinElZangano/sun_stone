/// @description
type=0
globalvar Socket;
globalvar Address;
globalvar Connected;
globalvar Ip;
globalvar NetId;
NetId = 0;
Connected = false;
Address = get_string("IP Address", "localhost");
Socket = network_create_socket(network_socket_tcp)
globalvar Hosting; Hosting = false
socket_map = ds_map_create();
players = [];