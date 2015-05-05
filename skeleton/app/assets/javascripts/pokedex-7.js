Pokedex.Views = (Pokedex.Views || {});

Pokedex.Views.PokemonForm = Backbone.View.extend({
  initialize: function(options) {
    this.model = options.model;
    this.collection = options.collection;
  },

  events: {
    "submit .new-pokemon" : "savePokemon"
  },

  render: function () {
    var content = JST["pokemonForm"]();
    this.$el.append(content);
  },

  savePokemon: function (event) {
    event.preventDefault();
    var $currentTarget = $(event.currentTarget);
    var pokemonParams = $currentTarget.serializeJSON();
    var pokemon = new Pokedex.Models.Pokemon(pokemonParams);
    pokemon.save({}, {
      success: function () {
        this.collection.add(pokemon);
        event.currentTarget.reset();
        var url = ("pokemon/" + pokemon.id);
        Backbone.history.navigate(url, { trigger : true })
      }.bind(this)
    })

  }
});
