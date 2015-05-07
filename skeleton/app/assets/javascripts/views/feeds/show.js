NewsReader.Views.FeedShow = Backbone.View.extend({
  template: JST["feeds/show"],

  events: {
    "click .refresh" : "refresh"
  },

  tagName: "main",

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var content = this.template({ feed: this.model, entries: this.model.entries() });
    this.$el.html(content);

    return this;
  },

  refresh: function (event) {
    event.preventDefault();
    this.model.fetch();
  }

});
