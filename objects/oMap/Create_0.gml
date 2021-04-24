/// @description Insert description here
// You can write your code in this editor
var gridMaxSize = 30;
var newNode;
var elements = 0.33 * gridMaxSize;
mapGrid[gridMaxSize][gridMaxSize] = 0;

randomize();


// populate map with dirt
for(var i = gridMaxSize;i>0;i--)
{
	for(var j = gridMaxSize;j>0;j--)
	{
		newNode = instance_create_layer(i*16,j*16,"lGridMap",oMapNode);
		mapGrid[i][j] = newNode;
	}
}

//seed map with random pools
for(var i = 0;i<elements;i++)
{
	var ranX = irandom_range(1,gridMaxSize);
	var ranY = irandom_range(1,gridMaxSize);
	
	mapGrid[ranX][ranY].nodeType = 1;
	mapGrid[ranX][ranY].genSize = irandom_range(1,9)
	mapGrid[ranX][ranY].sprite_index = sWaterNode;
}

working = true;

while(working)
{
	working = false;
	for(var i = gridMaxSize;i>0;i--)
	{
		for(var j = gridMaxSize;j>0;j--)
		{
			var thisNode = mapGrid[i][j]
			if thisNode.genSize > 0 {working = true;}
			newNode = thisNode;
			if(thisNode.nodeType>0 and thisNode.genSize > 0)
			{
			var dir = irandom(3)
		
				switch(dir)
				{
					case 0:
					if(i>1) {newNode = mapGrid[i-1][j];}
					newNode.xFromStart -=1;
					break
			
					case 1:
					if(i<gridMaxSize-1) {newNode = mapGrid[i+1][j];}
					newNode.xFromStart +=1;
					break
			
					case 2:
					if(j>1) {newNode = mapGrid[i][j-1];}
					newNode.yFromStart -=1;
					break
			
					case 3:
					if(j<gridMaxSize-1) {newNode = mapGrid[i][j+1];}
					newNode.yFromStart +=1;
					break
			
				}
				newNode.changeTo = thisNode.nodeType;
				newNode.genSize = thisNode.genSize -1
			thisNode.genSize = 0;
			}
		
		}
	}

	//sets all changed nodes to the proper type
	for(var i = gridMaxSize;i>0;i--)
	{
		for(var j = gridMaxSize;j>0;j--)
		{
			var thisNode = mapGrid[i][j]
			thisNode.nodeType = thisNode.changeTo;
			thisNode.changeTo = 0;
		
			switch(thisNode.nodeType)
			{
				case 1:
				thisNode.sprite_index = sWaterNode;
				break;
			}
		}
	}
}