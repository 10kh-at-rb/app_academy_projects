TrelloClone.Views.BoardsIndex = Backbone.View.extend({
  template:JST["boards/index"],

  initialize: function() {
    this.listenTo(this.collection, "sync remove", this.render)
  },

  events: {
    "click .delete": "destroyBoard"
  },

  destroyBoard: function(event) {
    event.preventDefault();
    var $target = $(event.target);
    var board = this.collection.get($target.attr("data-id"));
    if (window.confirm("Do you really want to delete "
                          + board.get("title") + "?")) {
      board.destroy();
    }
  },

  render: function() {
    var content = this.template({
      boards: this.collection
    });
    this.$el.html(content);
    return this;
  }
});
