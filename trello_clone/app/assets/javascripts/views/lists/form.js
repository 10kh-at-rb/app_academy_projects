TrelloClone.Views.ListForm = Backbone.View.extend({
  template: JST["lists/form"],

  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
    this.board = options.board;
  },

  events: {
    "submit": "submit"
  },

  render: function() {
    var content = this.template({
      list: this.model,
      board: this.board
    });
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var attrs = $(event.currentTarget).find("form").serializeJSON().list;
    this.model.set(attrs);

    var success = function() {
      this.board.lists().add(this.model, { merge: true });
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
