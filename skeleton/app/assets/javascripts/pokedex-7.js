Pokedex.Views = (Pokedex.Views || {});

Pokedex.Views.PokemonForm = Backbone.View.extend({
  events: {
    "submit .new-pokemon" : "savePokemon"
  },

  render: function () {
    var content = JST["pokemonForm"]();
    this.$el.append(content);
    return this;
  },

  savePokemon: function (event) {
    event.preventDefault();
    var $currentTarget = $(event.currentTarget);
    var pokemonParams = $currentTarget.serializeJSON().pokemon;
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
