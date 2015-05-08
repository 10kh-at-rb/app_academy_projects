TrelloClone.Collections.Lists = Backbone.Collection.extend({
  url: "api/lists",

  model: TrelloClone.Models.List,

  initialize: function(model, options) {
    this.board = options.board;
  },

  comparator: function(list) {
    return list.get('updated_at')
  },

  getOrFetch: function(id) {
    var lists = this;
    var list = this.get(id);
    if (!list) {
      list = new TrelloClone.Models.List({ id: id, board: this.board });
      list.fetch({
        success: function() {
          lists.add(list);
        }
      });
    } else {
      list.fetch();
    }

    return list;
  }

});
