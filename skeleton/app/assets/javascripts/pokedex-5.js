Pokedex.Views = {}

Pokedex.Views.PokemonIndex = Backbone.View.extend({
  events: {
  },

  initialize: function () {
    this.pokes = new Pokedex.Collections.Pokemon();
    this.pokes.fetch();
    this.listenToOnce(this.pokes, "sync", function() {
      this.render();
      this.listenTo(this.pokes, "add", this.render);
    })
  },

  addPokemonToList: function (pokemon) {
    var content = JST['pokemonListItem']({ pokemon: pokemon });
    this.$el.append(content)
  },

  refreshPokemon: function (options) {
  },

  render: function () {
    this.$el.empty();
    this.pokes.forEach(this.addPokemonToList.bind(this));
  },

  selectPokemonFromList: function (event) {
  }
});

Pokedex.Views.PokemonDetail = Backbone.View.extend({
  events: {
  },

  refreshPokemon: function (options) {
  },

  render: function () {
  },

  selectToyFromList: function (event) {
  }
});

Pokedex.Views.ToyDetail = Backbone.View.extend({
  render: function () {
  }
});


$(function () {
  var pokemonIndex = new Pokedex.Views.PokemonIndex();
  pokemonIndex.refreshPokemon();
  $("#pokedex .pokemon-list").html(pokemonIndex.$el);
});
