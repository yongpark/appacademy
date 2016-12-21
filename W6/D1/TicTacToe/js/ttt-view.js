let Board = require('./board.js');

class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $('li').on('click', (event) => {
      let $square = $(event.currentTarget);
      this.makeMove($square);
    });
  }

  makeMove($square) {
    let cp = this.game.currentPlayer;
    $square.addClass('marks');
    if (Board.isValidPos($square.data('pos'))){
      this.game.playMove($square.data('pos'));
      $square.addClass('marked');
      $square.append(cp);
      $square.addClass(cp);
    }

    if (this.game.winner()) {
      alert('You win!');
      console.log($(`.${cp}`));
      let $cp = $(`.${cp}`);
      $cp.addClass('winner');
    }
  }

  setupBoard() {
    let $ul = $("<ul>");

    for (let i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        let $li = $("<li>");
        $li.data('pos', [i, j]);
        $ul.append($li);
      }
    }
    this.$el.append($ul);
  }
}

module.exports = View;
