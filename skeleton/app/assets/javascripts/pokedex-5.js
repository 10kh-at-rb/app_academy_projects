Pokedex.Views = {}

Pokedex.Views.PokemonIndex = Backbone.View.extend({
  events: {
    "click li": "selectPokemonFromList"
  },

  initialize: function () {
    this.collection = new Pokedex.Collections.Pokemon();
    this.listenToOnce(this.collection, "sync", function() {
      this.render();
      this.listenTo(this.collection, "add", this.render);
    })
  },

  addPokemonToList: function (pokemon) {
    var content = JST['pokemonListItem']({ pokemon: pokemon });
    this.$el.append(content)
  },

  refreshPokemon: function (callback) {

    this.collection.fetch({
      success: function () {
        if (callback){
          callback();
        }
      }
    });
  },

  render: function () {
    this.$el.empty();
    this.collection.forEach(this.addPokemonToList.bind(this));
    return this;
  },

  selectPokemonFromList: function (event) {
    var $target = $(event.currentTarget);

    var pokeId = $target.data('id');
    var pokemon = this.collection.get(pokeId);

    Backbone.history.navigate("pokemon/" + pokeId, { trigger: true })

  }
});

Pokedex.Views.PokemonDetail = Backbone.View.extend({
  events: {
    "click .toys li": "selectToyFromList"
  },

  refreshPokemon: function (options) {

    this.model.fetch({
      success: function() {
        this.render();

        this.model.toys().forEach( function (toy) {
          var content = JST["toyListItem"]({ toy: toy });
          var $toysUl = this.$("ul.toys")//$("ul.toys");
          $toysUl.append(content);
        })
        if (options.callback){
          options.callback();
        }
      }.bind(this)
    })
  },

  render: function () {
    var content = JST['pokemonDetail']({ pokemon: this.model });
    this.$el.html(content);
    return this;
  },

  selectToyFromList: function (event) {
    var $currentTarget = $(event.currentTarget)
    var toyId = $currentTarget.data("id");
    var pokemonId = $currentTarget.data("pokemon-id");

    Backbone.history.navigate("pokemon/" + pokemonId + "/toys/" + toyId, { trigger: true });
  }
});

Pokedex.Views.ToyDetail = Backbone.View.extend({
  render: function (options) {
    var content = JST["toyDetail"]({
      toy: this.toyModel,
      pokes: this.collection
    });

    this.$el.html(content);
    return this;
  },

  initialize: function (options) {
    this.toyModel = options["toy"];
    this.collection = options["pokes"];
  },

  events: {
    "change .pokemon-selector": "reassignToy"
  },

  reassignToy: function (event) {
    var $currentTarget = $(event.currentTarget);

    var pokemon = this.collection.get($currentTarget.data("pokemon-id"));
    var toy = pokemon.toys().get($currentTarget.data("toy-id"));

    toy.set("pokemon_id", $currentTarget.val());
    toy.save({}, {
      success: (function () {
        pokemon.toys().remove(toy);
        var url = ("pokemon/" + pokemon.id);
        Backbone.history.navigate(url, { trigger : true });
        // this.renderToysList(pokemon.toys());
      }).bind(this)
    });
  }
});


// $(function () {
//   var pokemonIndex = new Pokedex.Views.PokemonIndex();
//   pokemonIndex.refreshPokemon();
//   $("#pokedex .pokemon-list").html(pokemonIndex.$el);
// });
