import sys, random

tileTypes = [1, 2, 3]

class Grid():
	def __init__(self, size):
		self.size = size		
		self.grid = []

		self.tiles = []
		self.validTiles = 0
		self.usedPositions = []

		self.buildGrid()
		self.getRandomTiles()

	def buildGrid(self):
		self.validTiles = 0
		for i in range(self.size):
			self.grid.append([])
			for j in range(self.size):
				placetileRoll = random.randint(0,5)
				if placetileRoll == 0:
					self.grid[i].append(0)
				else:
					self.grid[i].append(0)
					self.validTiles += 1

	def getRandomTiles(self):
		self.tiles = []
		for tile in range(self.validTiles):
			selectedTile = random.choice(tileTypes)
			self.tiles.append(selectedTile)

	def getSurroundingTilesForTile(self, tile, row, col):
		tiles = []
		surroundingMatrix = [{"row": row , "col": col + 1},
							 {"row": row, "col": col - 1},
							 {"row": row + 1, "col": col},
							 {"row": row - 1, "col": col}]
		
		# Find surrounding tiles
		#print("grid at {0}, {1}:".format(row, col))
		for mask in surroundingMatrix:
			if mask["row"] < self.size and mask["row"] >= 0 and mask["col"] < self.size and mask["col"] >= 0:
				tiles.append(self.grid[mask["row"]][mask["col"]])

		return tiles

	def placeTileAtRowCol(self, tile, row, col):
		for pos in self.usedPositions:
			if pos[0] == row and pos[1] == col:
				return False

		surroundingTiles = self.getSurroundingTilesForTile(tile, row, col)

		# Apply rules to see if tile placement is valid.
		otherColors = [tile]
		for stile in surroundingTiles:

			# Remember which colors this tile is touching
			if (stile not in otherColors) and (stile != 0):
				otherColors.append(stile)
			
			# If tile is touching both other colors, then return valid
			if len(otherColors) == 3:
				return True

		# If not touching any other colors
		if len(otherColors) == 1:
			return True

		return False

	def placeTile(self, tile):
		rowMid = random.randint(0, len(self.grid)-1)
		colMid = random.randint(0, len(self.grid)-1)

		#print("rowMid = {}".format(rowMid))
		#print("colMid = {}".format(colMid))

		# Starting somewhere in the middle of 
		for row in range(rowMid, -1, -1):
			for col in range(colMid, -1, -1):
				rv = self.placeTileAtRowCol(tile, row, col)
				if rv == True:
					self.grid[row][col] = tile
					self.usedPositions.append((row, col))
					return True
			for col in range(colMid, len(self.grid), 1):
				rv = self.placeTileAtRowCol(tile, row, col)
				if rv == True:
					self.grid[row][col] = tile
					self.usedPositions.append((row, col))
					return True

		for row in range(rowMid, len(self.grid), 1):
			for col in range(colMid, -1, -1):
				rv = self.placeTileAtRowCol(tile, row, col)
				if rv == True:
					self.grid[row][col] = tile
					self.usedPositions.append((row, col))
					return True
			for col in range(colMid, len(self.grid), 1):
				rv = self.placeTileAtRowCol(tile, row, col)
				if rv == True:
					self.grid[row][col] = tile
					self.usedPositions.append((row, col))
					return True

		#exit()
		return False

	def isGridValid(self):
		# Attempt to place each tile in a row
		self.usedPositions = []
		for tile in self.tiles:
			rv = self.placeTile(tile)
			if rv == False:
				return False
		return True

	def printGrid(self):
		print(self.size)
		for i in range(self.size):
			for j in range(self.size):
				sys.stdout.write("1" if self.grid[i][j] != 0 else "0")
				if j != self.size-1:
					sys.stdout.write(",")
				else:
					sys.stdout.write("\n")
		print(self.validTiles)
		for tile in self.tiles:
			print(tile)


def usage():
	print("python levelGen.py [size]")

def main():
	gridsize = int(sys.argv[1])

	while(1):
		grid = Grid(gridsize)
		for i in range(gridsize * 10000):
			if grid.isGridValid():
				grid.printGrid()
				exit()

if __name__ == "__main__":
	if len(sys.argv) != 2:
		usage()
	else:
		main()
