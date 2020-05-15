/// @description 
type=1
socket_list = ds_list_create()

/*
id
x
y
sprite
x_frame
y_frame
damage
*/
enemies_list = ds_list_create()
// Create first enemy
var linked_list = ds_list_create()
ds_list_add(linked_list, 0, 300, 300, spr_lizard, 0, 0, 4)
ds_list_add(enemies_list, linked_list)
ds_list_mark_as_list(enemies_list, 0)



/*
id
x
y
sprite
x_frame
y_frame
damage
*/
players_list = ds_list_create()