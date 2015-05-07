NewsReader.Routers.FeedRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.collection = new NewsReader.Collections.Feeds();
    this.collection.fetch();
  },

  routes: {
    "" : "feedIndex",
    "feeds/:id" : "showFeed"
  },

  feedIndex: function () {
    this._feedIndex = new NewsReader.Views.FeedIndex({ collection: this.collection });
    this.$rootEl.html(this._feedIndex.render().$el);
  },

  showFeed: function (id) {

  }

});
