TrelloClone.Views.ListShow = Backbone.CompositeView.extend({

  template: JST["lists/show"],

  tagName: "li",

  className: "list-show",

  initialize: function () {
    // this.listenTo(this.model, "sync", this.render)
    this.cards = this.model.cards();
    this.listenTo(this.cards, "add", this.addCardView);
    this.listenTo(this.cards, "add", this.addCardNewView);
    this.cards.each(this.addCardView.bind(this));
    this.addCardNewView();
  },

  onRender: function () {
    Backbone.CompositeView.prototype.onRender.call(this);
    var cards = this.cards;
    var that = this;


    this.$el.find(".sortable").sortable({
      connectWith: ".connectedSortable",
      cursor: "move",
      receive: function(event, ui) {

        var card = new TrelloClone.Models.Card({id: ui.item.attr("data-id")})
        var newListId = $(event.target).attr("data-id");
        // card.set("list_id", newListId);
        card.save({"list_id": newListId}, {
          success: function() {
            cards.add(card)
            that.$el.find(".card-show").each(function (liIndex) {
              var card2 = cards.get($(this).data("id"))
              card2.set("ord", liIndex);
              card2.save()
            })
          }
        });

          // debugger
        }
      })

      // deactivate: function (event, ui) {
      //   var $target = $(event.target);
      //   $target.children().each(function(li) {
      //     var $li = $(this);
      //     var card = cards.getOrFetch($li.attr("data-id"));
      //     card.
      //   })
      // }



        // $(".sortable").each(function(ulIndex) {
        //   var $list = $(this);
        //   $list.children().each(function() {
        //     var $li = $(this);
        //     var card = cards.getOrFetch($li.attr("data-id"))
        //     card.fetch({
        //       success: function() {
        //         card.set("ord", $li.index());
        //         card.save();
        //       }
        //     })
        //     // debugger;
        //   })
        // })

  },

  render: function() {
    var content = this.template({ list: this.model });
    this.$el.html(content);
    this.attachSubviews();
    this.onRender();
    return this;
  },

  addCardView: function(card) {
    var cardView = new TrelloClone.Views.CardShow({ model: card });
    this.addSubview('.cards', cardView);
  },

  addCardNewView: function() {
    var newCard = new TrelloClone.Models.Card();
    var cardNewView = new TrelloClone.Views.CardForm({ model: newCard, list: this.model })
    this.addSubview('.card-add', cardNewView);
  }

});
