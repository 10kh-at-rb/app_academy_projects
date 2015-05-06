Journal.Views.PostTitleBodyForm = Backbone.View.extend({
  templateTitle: JST['posts/title_form'],
  templateBody: JST['posts/body_form'],

  events: {
    "blur form": "submit"
  },

  render: function(target) {
    var template;
    target === "body" ? template = this.templateBody : template = this.templateTitle;
    var content = template({ post: this.model });
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var $currentTarget = $(event.currentTarget);
    var params = $currentTarget.serializeJSON().post;
    this.model.set(params);
    this.model.save({}, {
      success: function () {
        this.collection.fetch();
        var url = "posts/" + this.model.get("id");
        Backbone.history.navigate(url, {trigger: true});
      }.bind(this),
      error: function (a, b) {
        var errorMessage = b.responseJSON[0];
        this.render();
        this.$el.prepend(errorMessage);
      }.bind(this)
    });
  }
});
