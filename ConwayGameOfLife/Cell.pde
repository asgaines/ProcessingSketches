class Cell {
  int row;
  int col;
  boolean alive;
  
  public Cell(int row, int col, boolean alive) {
    this.row = row;
    this.col = col;
    this.alive = alive;
  }
  
  int numNeighbors() {
    // Return number of neighbors this cell has
    int num = 0;
    // Cell above
    if (!this.topEdge() && cells[this.row - 1][col].alive) {
      num++;
    }
    // Cell above, left
    if (!this.topEdge() && !this.leftEdge() && cells[this.row - 1][this.col - 1].alive) {
      num++;
    }
    // Cell above, right
    if (!this.topEdge() && !this.rightEdge() && cells[this.row - 1][this.col + 1].alive) {
      num++;
    }
    // Cell left
    if (!this.leftEdge() && cells[this.row][this.col - 1].alive) {
      num++;
    }
    // Cell left, below
    if (!this.leftEdge() && !this.bottomEdge() && cells[this.row + 1][this.col - 1].alive) {
      num++;
    }
    // Cell below
    if (!this.bottomEdge() && cells[this.row + 1][this.col].alive) {
      num++;
    }
    // Cell below, right
    if (!this.bottomEdge() && !this.rightEdge() && cells[this.row + 1][this.col + 1].alive) {
      num++;
    }
    // Cell right
    if (!this.rightEdge() && cells[this.row][this.col + 1].alive) {
      num++;
    }
    
    return num;
  }
  
  boolean topEdge() {
    return this.row == 0;
  }
  
  boolean bottomEdge() {
    return this.row == numRows - 1;
  }
  
  boolean leftEdge() {
    return this.col == 0;
  }
  
  boolean rightEdge() {
    return this.col == numCols - 1;
  }
  
  void draw() {
    if (this.alive) {
      fill(60, 255, 60);
    } else {
      fill(140, 140, 160);
    }
    rect(this.col * colWidth, this.row * rowHeight, colWidth - 1, rowHeight - 1);
  }
}
  