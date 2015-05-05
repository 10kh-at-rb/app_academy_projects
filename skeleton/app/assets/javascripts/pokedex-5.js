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
        callback();
      }
    });
  },

  render: function () {
    this.$el.empty();
    this.collection.forEach(this.addPokemonToList.bind(this));
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
        if (options.callback){
          options.callback();
        }
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
    var toyId = $currentTarget.data("id");
    var pokemonId = $currentTarget.data("pokemon-id");

    Backbone.history.navigate("pokemon/" + pokemonId + "/toys/" + toyId, { trigger: true });
    // var toyDetailView = new Pokedex.Views.ToyDetail({toy: toy, pokes: []})
    // $("#pokedex .toy-detail").html(toyDetailView.$el);
    //
    // toyDetailView.render();
  }
});

Pokedex.Views.ToyDetail = Backbone.View.extend({
  render: function (options) {
    var content = JST["toyDetail"]({ toy: this.toyModel, pokes: this.collection});
    this.$el.html(content);
  },

  initialize: function (options) {
    this.toyModel = options["toy"];
    this.collection = options["pokes"];
  }
});


// $(function () {
//   var pokemonIndex = new Pokedex.Views.PokemonIndex();
//   pokemonIndex.refreshPokemon();
//   $("#pokedex .pokemon-list").html(pokemonIndex.$el);
// });
