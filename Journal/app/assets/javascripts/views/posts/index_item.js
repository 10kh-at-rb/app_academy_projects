Journal.Views.PostsIndexItem = Backbone.View.extend({
  events: {
    "click .delete-button": "removeItem",
    "click .edit-button": "editItem"
  },
  tagName: 'li',
  template: JST["posts/index_item"],

  render: function () {
    var content = this.template({post: this.model});
    this.$el.html(content);
    return this;
  },

  removeItem: function () {
    this.model.destroy({wait: true});
  },

  editItem: function() {
    var url = "posts/" + this.model.get("id") + "/edit";
    Backbone.history.navigate(url, { trigger: true });
  }
});
