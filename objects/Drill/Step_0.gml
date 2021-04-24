/// @description Insert description here
// You can write your code in this editor
if keyboard_check(ord("W"))
{
	vrt_speed += 1;
}

if keyboard_check(ord("S"))
{
	if (vrt_speed>=1)
	{
		vrt_speed -= 1;
	}
}

y += vrt_speed;