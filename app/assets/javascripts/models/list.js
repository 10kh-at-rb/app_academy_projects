TrelloClone.Models.List = Backbone.Model.extend({
  urlRoot: "api/lists",

  lists: function() {
    if (!this._lists) {
      this._lists = new TrelloClone.Collections.Lists([], { feed: this });
    }

    return this._lists;
  },

  parse: function (response) {
    if (response.lists) {
      this.lists().set(response.lists, { parse: true });
      delete response.lists;
    }

    return response;
  }
});
