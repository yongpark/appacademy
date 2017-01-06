import React from 'react';


import PokemonIndexItem from './pokemon_index_item';

class pokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  // componentDidMount() {
  //   this.props.requestAllPokemon();
  // }

  render() {
    const pokemons = this.props.pokemon.map((pokemon) => (
      <PokemonIndexItem
        key={pokemon.id}
        pokemon={pokemon} />
    ));

    return(
      <section className="pokedex">
        <ul className="pokedex-index">
          {
            pokemons
          }
        </ul>

        <div className="pokedex-show">
          {
            this.props.children
          }
        </div>
      </section>
    );
  }
}

export default pokemonIndex;
