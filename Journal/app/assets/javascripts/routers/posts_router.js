Journal.Routers.PostsRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.$sidebar = this.$rootEl.find('.sidebar');
    this.posts = new Journal.Collections.Posts();
    this.$content = this.$rootEl.find('.content');
    this.index();
  },

  routes: {
    "": 'index',
    "posts/new": "new",
    "posts/:id/edit": 'edit',
    "posts/:id": 'show'
  },

  index: function () {
    this.posts.fetch();
    this._postIndexView = new Journal.Views.PostsIndex({collection: this.posts});
    this.$sidebar.html(this._postIndexView.render().$el);
  },

  show: function (id) {
    var currentPost = this.posts.getOrFetch(id);
    var showView = new Journal.Views.PostShow({model: currentPost});
    this._swapView(showView);
  },

  edit: function (id) {
    var currentPost = this.posts.getOrFetch(id);
    var editView = new Journal.Views.PostForm({model: currentPost});
    this._swapView(editView);
  },

  new: function () {
    var newPost = new Journal.Models.Post();
    var newView = new Journal.Views.PostForm({collection: this.posts, model: newPost});
    this._swapView(newView);
  },

  _swapView: function (newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;
    this.$content.html(newView.render().$el);
  }
});
