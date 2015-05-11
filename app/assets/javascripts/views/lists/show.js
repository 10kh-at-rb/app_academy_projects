TrelloClone.Views.ListShow = Backbone.CompositeView.extend({

  template: JST["lists/show"],

  tagName: "li",

  className: "list-show",

  initialize: function () {
    this.listenTo(this.model, "sync", this.render)
    this.cards = this.model.cards();
    this.listenTo(this.cards, "add", this.addCardView);
    this.listenTo(this.cards, "add", this.addCardNewView);
    this.cards.each(this.addCardView.bind(this));
    this.addCardNewView();
  },

  onRender: function () {
    Backbone.CompositeView.prototype.onRender.call(this);
    this.$el.find(".sortable").sortable({
      connectWith: ".connectedSortable",
      cursor: "move"
    }).disableSelection();

  },

  render: function() {
    var content = this.template({ list: this.model });
    this.$el.html(content);
    this.attachSubviews();
    this.onRender();
    return this;
  },

  addCardView: function(card) {
    var cardView = new TrelloClone.Views.CardShow({ model: card });
    this.addSubview('.cards', cardView);
  },

  addCardNewView: function() {
    var newCard = new TrelloClone.Models.Card();
    var cardNewView = new TrelloClone.Views.CardForm({ model: newCard, list: this.model })
    this.addSubview('.card-add', cardNewView);
  }

});
