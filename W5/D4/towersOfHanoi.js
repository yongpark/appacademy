const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class towersOfHanoi {
  constructor() {
    this.towers = [ [1,2,3], [], []];
  }

  validMove(tower1, tower2) {
    console.log("in the loop");
    if (this.towers[tower1].length === 0) {
      return false;
    }
    if ((this.towers[tower2][0] < this.towers[tower1][0]) || this.towers[tower2].length === 0) {
      return true;
    } else {
      return false;
    }
  }

  gameOver() {
    if (this.towers[0].length === 0 && (this.towers[1].length === 0 || this.towers[2].length === 0)) {
      return true;
    } else {
      return false;
    }
  }

  promptMove() {
    reader.question("Please enter the first tower:", function(position) {
      reader.question("Please enter the second tower:", function(position2) {
        const tower1 = parseInt(position);
        const tower2 = parseInt(position2);

      });
    });
  }


  //run function
  run() {
    // until tower 1 is empty AND tower 2 or tower 3 are empty
    if (this.gameOver()) {
      console.log("Congrats, you win!");
      reader.close();
    }
    if (this.gameOver() === false) {
      (this.promptMove());
      let moves = this.promptMove();
      console.log(moves);
      if (this.validMove(moves[0], moves[1])) {
        this.towers[moves[1]].unshift(this.towers[moves[0]].shift);
      } else {
        console.log("Invalid move");
      }
    }
  }
}

let towers = new towersOfHanoi;
// towers.run();
let moves = towers.promptMove();
