TrelloClone.Collections.Cards = Backbone.Collection.extend({
  url: "api/cards",

  initialize: function(model, options) {
    this.list = options.list;
  },

  model: TrelloClone.Models.Card,

  getOrFetch: function (id) {
    var cards = this;
    var card = this.get(id);
    if (!card) {
      card = new TrelloClone.Models.Card({id: id})
      card.fetch({
        success: function () {
          cards.add(card)
        }
      });
    } else {
      card.fetch();
    }
    return card;
  }

});
