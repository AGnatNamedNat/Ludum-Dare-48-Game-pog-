/// @description Insert description here
// You can write your code in this editor
var rot_constant = 5;
var maxrot = 70;


if keyboard_check(ord("A"))
{
	image_angle -= rot_constant;
}

if keyboard_check(ord("D"))
{
	image_angle += rot_constant;
}

if image_angle > maxrot
{
	image_angle = maxrot;
}

if image_angle < (maxrot * -1)
{
	image_angle = (maxrot * -1)
}