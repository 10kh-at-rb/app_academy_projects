Pokedex.Router = Backbone.Router.extend({
  routes: {
    "" : "pokemonIndex",
    "pokemon/new" : "pokemonForm",
    "pokemon/:id/toy" : "toyDetail",
    "pokemon/:id" : "pokemonDetail"
  },

  pokemonDetail: function (id, callback) {
    if (!this._pokemonIndex) {
      this.pokemonIndex(function () {
        this.pokemonDetail(id, callback);
      }.bind(this));
    }
    var pokemon = this._pokemonIndex.collection.get(id);
    var view = new Pokedex.Views.PokemonDetail({model: pokemon});
    view.refreshPokemon();
  },

  pokemonIndex: function (callback) {
    console.log("i came first")
    this._pokemonIndex = new Pokedex.Views.PokemonIndex();

    this._pokemonIndex.refreshPokemon(callback);

    $("#pokedex .pokemon-list").html(this._pokemonIndex.$el);
  },

  toyDetail: function (pokemonId, toyId) {
  },

  pokemonForm: function () {
  }
});

$(function () {
  new Pokedex.Router();
  Backbone.history.start();
});
