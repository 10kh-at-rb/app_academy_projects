NewsReader.Views.FeedEntry = Backbone.View.extend({
  template: JST["feeds/entry"],

  tagName: "li",

  render: function() {
    var content = this.template({ entry: this.model });
    this.$el.html(content);

    return this;
  }

});
