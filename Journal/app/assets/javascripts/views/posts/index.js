Journal.Views.PostsIndex = Backbone.View.extend({
  initialize: function () {
    this.collection = new Journal.Collections.Posts();
    this.collection.fetch();
    this.listenTo(this.collection, "sync remove", this.render);
  },
  template: JST['posts'],
  tagName: 'ul',

  render: function () {
    $('.journal').append(this.$el);
    var content = this.template();
    this.$el.html(content);

    this.collection.each(function(post) {
      var view = new Journal.Views.PostsIndexItem({ model: post});
      this.$el.append(view.render().$el);
    }.bind(this));

    return this;
  }
});
