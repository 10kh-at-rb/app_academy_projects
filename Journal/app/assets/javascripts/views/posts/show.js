Journal.Views.PostShow = Backbone.View.extend({
  tagName: 'section',

  events: {
    "dblclick h2": "editTitle",
    "dblclick p": "editBody"
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  template: JST['posts/show'],

  render: function () {
    var content = this.template({ post: this.model});
    this.$el.html(content);
    return this;
  },

  editTitle: function (event) {
    var newView = new Journal.Views.PostTitleBodyForm({model: this.model});
    $(event.currentTarget).html(newView.render("title").$el);
  },

  editBody: function (event) {
    var newView = new Journal.Views.PostTitleBodyForm({model: this.model});
    $(event.currentTarget).html(newView.render("body").$el);
  }
});
