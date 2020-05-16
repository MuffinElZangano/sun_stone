
/*
id
x
y
sprite
x_frame
y_frame
damage
*/
enum pv
{
	myid,
	name,
	level,
	experience,
	xx,
	yy,
	sprite,
	xframe,
	yframe,
	damage,
	animlength
}
globalvar Players_List; Players_List = ds_list_create()
// Create first player
var linked_list = ds_list_create()
ds_list_add(linked_list, 1, "player", 1, 0, 80, 80, spr_player_preview, 0, 0, 4, 7)
ds_list_add(Players_List, linked_list)
ds_list_mark_as_list(Players_List, 0)