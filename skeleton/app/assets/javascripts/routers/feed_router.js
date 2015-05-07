NewsReader.Routers.FeedRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.collection = new NewsReader.Collections.Feeds();
    this.collection.fetch();
  },

  routes: {
    "" : "feedIndex",
    "feeds/:id" : "feedShow"
  },

  feedIndex: function () {
    this._feedIndex = new NewsReader.Views.FeedIndex({ collection: this.collection });
    this.$rootEl.html(this._feedIndex.render().$el);
  },

  feedShow: function (id) {
    var feed = this.collection.getOrFetch(id);
    
    this._feedShow = new NewsReader.Views.FeedShow({ model: feed });
    this.$rootEl.html(this._feedShow.render().$el);
  }

});
