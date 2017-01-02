boolean gameOn = false;
int numRows = 20;
int numCols = 20;
int rowHeight;
int colWidth;
// Matrix of cells
Cell[][] cells = new Cell[numRows][numCols];
// Buffer in which to calculate next generation
Cell[][] cellsOffspring = new Cell[numRows][numCols];
 
void setup() {
  size(700, 700);
  colWidth = width / numCols;
  rowHeight = height / numRows;
  
  // Draw the grid lines
  for (int i = colWidth - 1; i < width; i += colWidth) {
    line(i, 0, i, height);
  }
  for (int j = rowHeight - 1; j < height; j += rowHeight) {
    line(0, j, width, j);
  }
  
  noStroke();
  // Initialize the cells
  for (int row = 0; row < numRows; row++) {
    for (int col = 0; col < numCols; col++) {
      cells[row][col] = new Cell(row, col, false);
    }
  }
}

void draw() {
  // Draw the cells on the board
  for (int row = 0; row < numRows; row++) {
    for (int col = 0; col < numCols; col++) {
      cells[row][col].draw();
    }
  }
  
  if (gameOn) {
    // Determine the next generation based on Conway's rules
    for (int row = 0; row < numRows; row++) {
      for (int col = 0; col < numCols; col++) {
        boolean newLife;
        if (cells[row][col].alive) {
          newLife = cells[row][col].numNeighbors() == 2 || cells[row][col].numNeighbors() == 3;
        } else {
          newLife = cells[row][col].numNeighbors() == 3;
        }
        cellsOffspring[row][col] = new Cell(row, col, newLife);
      }
    }
    
    // Shift the new generation to forefront
    for (int row = 0; row < numRows; row++) {
      for (int col = 0; col < numCols; col++) {
        cells[row][col] = cellsOffspring[row][col];
      }
    }
  }
  
  delay(100);
}

void mouseClicked() {
  Cell cellClicked = cells[mouseY / rowHeight][mouseX / colWidth];
  cellClicked.alive = !cellClicked.alive;
}

void keyPressed() {
  if (key == ' ') {
    gameOn = !gameOn;
  }
}