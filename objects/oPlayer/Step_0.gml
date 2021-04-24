/// @description Movement
// You can write your code in this editor
if (hascontrol)
	{
		key_left = keyboard_check(ord("A"));
		key_right = keyboard_check(ord("D"));
		key_jump = keyboard_check_pressed(vk_space);

		if (key_left) or (key_right) or (key_jump)
		{
			controller = 0;
		}

		if (abs(gamepad_axis_value(0, gp_axislh)) > 0.2)
		{
			key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
			key_right = max(gamepad_axis_value(0,gp_axislh),0);
			controller = 1;
		}
		if (gamepad_button_check(0, gp_face1))
		{
			key_jump = 1;
			controller = 1;
		}
	}
	else
	{
		key_jump = 0;
		key_right = 0;
		key_left = 0;
	}

		// Calculate -1/0/1 times walksp
		var move = key_right - key_left;

		hsp = move * walksp;

		vsp = vsp + grv

		// Jumping

		if (place_meeting(x, y + 1, oCol) and (key_jump))
		{
			vsp = -10;
		}

		// Horizontal Collision
		if (place_meeting(x + hsp, y, oCol))
		{
			while (!place_meeting ( x+sign(hsp), y, oCol))
			{
				x = x + sign(hsp);
			}
			hsp = 0
		}

		x = x + hsp;

		// Vertical Collision
		if (place_meeting(x, y + vsp, oCol))
		{
			while (!place_meeting ( x, y + sign(vsp), oCol))
			{
				y = y + sign(vsp);
			}
			vsp = 0
		}

		y = y + vsp;
	