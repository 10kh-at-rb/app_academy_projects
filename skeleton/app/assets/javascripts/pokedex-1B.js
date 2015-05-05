Pokedex.RootView.prototype.renderPokemonDetail = function (pokemon) {
  this.$pokeDetail.empty();
  var content = JST['pokemonDetail']({ pokemon: pokemon });
  // debugger;
  pokemon.fetch( {
    success: function(){
      pokemon.toys().forEach(this.addToyToList.bind(this))
    }.bind(this)
  });
  this.$pokeDetail.append(content)

};

Pokedex.RootView.prototype.selectPokemonFromList = function (event) {
  // Phase II
  this.$toyDetail.empty();

  // Phase IB
  var $target = $(event.currentTarget);

  var pokeId = $target.data('id');
  var pokemon = this.pokes.get(pokeId);

  this.renderPokemonDetail(pokemon);
};
