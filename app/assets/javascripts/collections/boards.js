TrelloClone.Collections.Boards = Backbone.Collection.extend({
  url: 'api/boards',

  model: TrelloClone.Models.Board,

  comparator: function(board) {
    return board.get('updated_at')
  },

  getOrFetch: function(id) {
    var boards = this;
    var board = this.get(id);
    if (!board) {
      board = new TrelloClone.Models.Board({ id: id });
      board.fetch({
        success: function() {
          boards.add(board);
        }
      });
    } else {
      board.fetch();
    }

    return board;
  }
})
