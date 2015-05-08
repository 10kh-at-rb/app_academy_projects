TrelloClone.Views.ListShow = Backbone.CompositeView.extend({

  template: JST["lists/show"],

  className: "list-show",

  initialize: function () {
    this.listenTo(this.model, "sync", this.render)
    this.cards = this.model.cards();
    this.listenTo(this.cards, "add", this.addCardView);
    this.cards.each(this.addCardView.bind(this));
  },

  render: function() {
    var content = this.template({ list: this.model });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addCardView: function(card) {
    var cardView = new TrelloClone.Views.CardShow({ model: card });
    this.addSubview('.cards', cardView);
  }

});
