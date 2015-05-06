Journal.Routers.PostsRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.posts = new Journal.Collections.Posts();
  },

  routes: {
    "": 'index',
    "posts/:id": 'show'
  },

  index: function () {
    this.posts.fetch();
    this._postIndexView = new Journal.Views.PostsIndex({collection: this.posts});
    this.$rootEl.html(this._postIndexView.render().$el);
  },

  show: function (id) {
    var currentPost = this.posts.getOrFetch(id);
    this._postShowView = new Journal.Views.PostShow({model: currentPost});
    this.$rootEl.html(this._postShowView.render().$el);
  }
});
