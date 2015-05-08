TrelloClone.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.boards = new TrelloClone.Collections.Boards();
    this.boards.fetch();
  },

  routes: {
    "": "boardIndex",
    "boards/new": "newBoard",
    "boards/:id": "showBoard",
    "boards/:id/edit": "editBoard"
  },

  boardIndex: function() {
    var indexView = new TrelloClone.Views.BoardsIndex({
      collection: this.boards });
    this._swapView(indexView);
  },

  showBoard: function(id) {
    var board = this.boards.getOrFetch(id);
    var showView = new TrelloClone.Views.BoardShow({
      model: board,
      collection: this.boards });
    this._swapView(showView);

  },

  newBoard: function() {
    var newBoard = new TrelloClone.Models.Board();
    var newView = new TrelloClone.Views.BoardForm({
      model: newBoard,
      collection: this.boards });
    this._swapView(newView);
  },

  editBoard: function(id) {
    var board = this.boards.getOrFetch(id);
    var editView = new TrelloClone.Views.BoardForm({
      collection: this.boards,
      model: board
    });
    this._swapView(editView);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }


})
