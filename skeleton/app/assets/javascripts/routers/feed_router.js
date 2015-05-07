NewsReader.Routers.FeedRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.collection = new NewsReader.Collections.Feeds();
    this.collection.fetch();
    this.$sidebar = this.$rootEl.find(".sidebar");
    this.$feeds = this.$rootEl.find(".feeds");
  },

  routes: {
    "" : "feedIndex",
    "feeds/:id" : "feedShow"
  },

  feedIndex: function () {
    this._feedIndex = new NewsReader.Views.FeedIndex({ collection: this.collection });
    this.$sidebar.html(this._feedIndex.render().$el);
  },

  feedShow: function (id) {
    if (!this._feedIndex) {
      this.feedIndex();
    }
    var feed = this.collection.getOrFetch(id);
    var feedShow = new NewsReader.Views.FeedShow({ model: feed });
    this._swapView(feedShow);
  },

  _swapView: function(newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;
    this.$feeds.html(newView.render().$el);
  }



});
