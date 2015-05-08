TrelloClone.Views.BoardShow = Backbone.CompositeView.extend({

  template: JST["boards/show"],

  className: "board-show group",

  events: {
    "click .new-list": "makeNewList"
  },

  initialize: function () {
    this.listenTo(this.model, "sync", this.render)
    this.lists = this.model.lists();
    this.listenTo(this.lists, "add remove", this.addListView);
    this.lists.each(this.addListView.bind(this));
  },

  render: function() {
    var content = this.template({ board: this.model });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addListView: function(list) {
    var listView = new TrelloClone.Views.ListShow({ model: list });
    this.addSubview('.lists', listView);
  },

  makeNewList: function(event) {
    event.preventDefault();
    var newList = new TrelloClone.Models.List();
    var newListView = new TrelloClone.Views.ListForm({ board: this.model, model: newList })


    this.$el.append(newListView.render().$el);
  }

});
