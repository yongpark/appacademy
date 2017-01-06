import React from 'react';

class pokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const pokemons = this.props.pokemon.map((pokemon, i) => (
      <li key={i}>
        {pokemon.name}
        <br/>
        <img src = {pokemon.image_url} width="100" height="auto"/>
      </li>
    ));

    return(
      <ul>
        {
          pokemons
        }
      </ul>
    );
  }
}

export default pokemonIndex;
