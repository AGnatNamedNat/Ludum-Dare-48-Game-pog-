/// @description Insert description here
// You can write your code in this editor
var gridMaxSize = 30;
var newNode;
mapGrid[gridMaxSize][gridMaxSize] = 0;


// populate map
for(var i = gridMaxSize;i>0;i--)
{
	for(var j = gridMaxSize;i>0;i--)
	{
		newNode = instance_create_layer(i*16,j*16,"lGridMap",obj_oMapNode);
		mapGrid[i][j] = newNode;
	}
	
}