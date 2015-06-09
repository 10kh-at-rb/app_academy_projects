TrelloClone.Views.CardForm = Backbone.View.extend({
  template: JST["cards/form"],

  tagName: "form",

  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
    this.list = options.list;
  },

  events: {
    "click button": "submit"
  },

  render: function() {
    var content = this.template({
      list: this.list
    });
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var attrs = this.$el.serializeJSON().card;
    this.model.set(attrs);

    var success = function() {
      this.list.cards().add(this.model, { merge: true });
      this.remove();
      // var url = "boards/" + boardId;
      // Backbone.history.navigate(url, { trigger: true });
    }.bind(this);

    var that = this;
    var errors = function (model, response) {
      var $errorList = $("<ul>");
      response.responseJSON.forEach(function(error) {
        var $li = $("<li>");
        $li.html(error);
        $errorList.append($li);
        that.$el.prepend($errorList);
      })
    }

    this.model.save({}, {
      success: success,
      error: errors
    });

  }

});
