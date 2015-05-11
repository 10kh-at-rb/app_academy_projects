TrelloClone.Views.CardShow = Backbone.CompositeView.extend({
  template: JST["cards/show"],

  className: "card-show",

  tagName: "li",

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "click .delete-card": "deleteCard"
  },

  deleteCard: function (event) {
    event.preventDefault();
    this.model.destroy({
      success: function() {
        this.remove()
      }.bind(this)
    });
  },

  render: function() {
    var content = this.template({ card: this.model });
    this.$el.html(content);
    this.$el.attr("data-id", this.model.get("id"));
    return this;
  }
})
