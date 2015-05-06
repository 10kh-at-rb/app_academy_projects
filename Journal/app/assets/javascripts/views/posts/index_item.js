Journal.Views.PostsIndexItem = Backbone.View.extend({
  events: {
    "click .delete-button": "removeItem"
  },
  tagName: 'li',
  template: JST["posts/index_item"],

  render: function () {
    var content = this.template({post: this.model});
    this.$el.html(content);
    return this;
  },

  removeItem: function () {
    console.log(this.model)
    console.log(this.model.destroy({wait: true}));
  }
});
