NewsReader.Views.FeedShow = Backbone.CompositeView.extend({
  template: JST["feeds/show"],

  events: {
    "click .refresh" : "refresh"
  },

  tagName: "main",

  className: "feed-show",

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.collection = this.model.entries();
    this.listenTo(this.collection, "add", this.addEntryView);
    this.collection.each(this.addEntryView.bind(this));
  },

  addEntryView: function (entry) {
    var entryView = new NewsReader.Views.FeedEntry({ model: entry });
    this.addSubview('.entry-list', entryView, true);
  },

  render: function () {
    var content = this.template({ feed: this.model });
    this.$el.html(content);
    this.attachSubviews();

    return this;
  },

  refresh: function (event) {
    event.preventDefault();
    this.model.fetch();
  }

});
