NewsReader.Views.FeedIndex = Backbone.CompositeView.extend({
  template: JST["feeds/index"],

  className: "index",

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "add", this.addIndexItem);
    this.collection.each(this.addIndexItem.bind(this));
  },

  addIndexItem: function (item) {
    var indexItemView = new NewsReader.Views.IndexItem({ model: item });
    this.addSubview(".feed-list", indexItemView);
  },

  render: function () {
    var content = this.template({ feeds: this.collection });
    this.$el.html(content);
    this.attachSubviews();

    return this;
  }

});
