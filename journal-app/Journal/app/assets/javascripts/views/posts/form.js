Journal.Views.PostForm = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.model, "error", this.render);
  },

  events: {
    "submit form": "submit"
  },

  template: JST['posts/form'],

  render: function() {
    var content = this.template({ post: this.model });
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
        if (this.collection) {
          this.collection.add(this.model, { merge: true });
        }
        var url = "posts/" + this.model.get("id");
        Backbone.history.navigate(url, {trigger: true});
      }.bind(this),
      error: function (a, b) {
        var errorMessage = b.responseJSON[0];
        this.$el.prepend(errorMessage);
      }.bind(this)
    });
  }
});
