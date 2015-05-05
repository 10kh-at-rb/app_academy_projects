Pokedex.Router = Backbone.Router.extend({
  routes: {
    "" : "pokemonIndex",
    "pokemon/new" : "pokemonForm",
    "pokemon/:id/toys/:toyId" : "toyDetail",
    "pokemon/:id" : "pokemonDetail"
  },

  pokemonDetail: function (id, callback) {
    if (!this._pokemonIndex) {
      this.pokemonIndex(function () {
        this.pokemonDetail(id, callback);
      }.bind(this));
    } else {
      var pokemon = this._pokemonIndex.collection.get(id);
      this._pokemonDetail = new Pokedex.Views.PokemonDetail({model: pokemon});
      this._pokemonDetail.refreshPokemon({callback: callback});
      if (this._toyDetailView){
        this._toyDetailView.remove();
      }
    }
  },

  pokemonIndex: function (callback) {
    this._pokemonIndex = new Pokedex.Views.PokemonIndex();

    this._pokemonIndex.refreshPokemon(callback);
    this.pokemonForm();


    $("#pokedex .pokemon-list").html(this._pokemonIndex.$el);

  },

  toyDetail: function (pokemonId, toyId) {
    if (!this._pokemonDetail) {
      this.pokemonDetail(pokemonId, function() {
        this.toyDetail(pokemonId, toyId);
      }.bind(this))
    } else {
      var toy = this._pokemonDetail.model.toys().get(toyId);
      this._toyDetailView = new Pokedex.Views.ToyDetail({toy: toy, pokes: []})
      $("#pokedex .toy-detail").html(this._toyDetailView.$el);

      this._toyDetailView.render();
    }
  },

  pokemonForm: function () {
    var model = new Pokedex.Models.Pokemon()
    var pokemonForm = new Pokedex.Views.PokemonForm({
      model: model,
      collection: this._pokemonIndex.collection
    });
    pokemonForm.render();
    // debugger;
    $('#pokedex .pokemon-form').html(pokemonForm.$el)
  }
});

$(function () {
  new Pokedex.Router();
  Backbone.history.start();
});
