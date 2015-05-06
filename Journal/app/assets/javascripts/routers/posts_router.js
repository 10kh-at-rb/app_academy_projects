Journal.Routers.PostsRouter = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.posts = new Journal.Collections.Posts();
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
    this.$rootEl.html(this._postIndexView.render().$el);
  },

  show: function (id) {
    var currentPost = this.posts.getOrFetch(id);
    this._postShowView = new Journal.Views.PostShow({model: currentPost});
    this.$rootEl.html(this._postShowView.render().$el);
  },

  edit: function (id) {
    var currentPost = this.posts.getOrFetch(id);
    var editView = new Journal.Views.PostForm({model: currentPost});
    this.$rootEl.html(editView.render().$el);
  },

  new: function () {
    var newPost = new Journal.Models.Post();
    var newView = new Journal.Views.PostForm({collection: this.posts, model: newPost});
    this.$rootEl.html(newView.render().$el);
  }
});
