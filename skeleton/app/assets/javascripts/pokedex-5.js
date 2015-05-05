Pokedex.Views = {}

Pokedex.Views.PokemonIndex = Backbone.View.extend({
  events: {
    "click li": "selectPokemonFromList"
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
    var $target = $(event.currentTarget);

    var pokeId = $target.data('id');
    var pokemon = this.pokes.get(pokeId);

    var view = new Pokedex.Views.PokemonDetail({model: pokemon});
    view.refreshPokemon();

  }
});

Pokedex.Views.PokemonDetail = Backbone.View.extend({
  events: {
    "click .toys li": "selectToyFromList"
  },

  initialize: function (options) {
    this.model = options["model"];
  },

  refreshPokemon: function (options) {
    this.model.fetch({
      success: function() {
        $("#pokedex .pokemon-detail").html(this.$el);
        this.render();
        this.model.toys().forEach( function (toy) {
          var content = JST["toyListItem"]({ toy: toy });
          var $toysUl = $("ul.toys");
          $toysUl.append(content);
        })
      }.bind(this)
    })
  },

  render: function () {
    this.$el.empty();
    var content = JST['pokemonDetail']({ pokemon: this.model });
    this.$el.append(content);
    // pokemon.fetch( {
    //   success: function(){
    //     pokemon.toys().forEach(this.addToyToList.bind(this))
    //   }.bind(this)
    // });

  },

  selectToyFromList: function (event) {
    var $currentTarget = $(event.currentTarget)
    var toy = this.model.toys().get($currentTarget.data("id"))
    var toyDetailView = new Pokedex.Views.ToyDetail({toy: toy, pokes: []})
    $("#pokedex .toy-detail").html(toyDetailView.$el);

    toyDetailView.render();
  }
});

Pokedex.Views.ToyDetail = Backbone.View.extend({
  render: function (options) {
    console.log("hi")
    var content = JST["toyDetail"]({ toy: this.toyModel, pokes: this.pokes});
    this.$el.html(content);
  },

  initialize: function (options) {
    this.toyModel = options["toy"];
    this.pokes = options["pokes"];
  }
});


$(function () {
  var pokemonIndex = new Pokedex.Views.PokemonIndex();
  pokemonIndex.refreshPokemon();
  $("#pokedex .pokemon-list").html(pokemonIndex.$el);
});
