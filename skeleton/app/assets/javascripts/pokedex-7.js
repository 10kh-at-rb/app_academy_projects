Pokedex.Views = (Pokedex.Views || {});

Pokedex.Views.PokemonForm = Backbone.View.extend({
  initialize: function(options) {
    this.model = options.model;
    this.collection = options.collection;
  },

  events: {
  },

  render: function () {
    var content = JST["pokemonForm"]();
    this.$el.append(content);
  },

  savePokemon: function (event) {
  }
});
