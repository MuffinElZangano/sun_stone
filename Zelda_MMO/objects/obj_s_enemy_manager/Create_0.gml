/*
id
x
y
sprite
x_frame
y_frame
damage
anim_length
state
dir
spd
*/
enum ev
{
	myid,
	name,
	level,
	xx,
	yy,
	sprite,
	xframe,
	yframe,
	damage,
	animlength,
	state,
	dir,
	spd,
	patrolstartx,
	patrolstarty,
	patrolendx,
	patrolendy,
	targetx,
	targety	
}
globalvar Enemies_List; Enemies_List = ds_list_create()
// Create first enemy
var linked_list = ds_list_create()
ds_list_add(linked_list, 1, "lizard", 1, 225, 225, spr_lizard, 0, 0, 4, 3, "patrol_1", 1, 1, 225, 225, 340, 225, 0, 0)
ds_list_add(Enemies_List, linked_list)
ds_list_mark_as_list(Enemies_List, 0)