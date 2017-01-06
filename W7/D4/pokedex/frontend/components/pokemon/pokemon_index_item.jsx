import React from 'react';
import { Link } from 'react-router';

const PokemonIndexItem = ({ pokemon }) => (
  <li>
    <Link to={ `/pokemon/${pokemon.id}` }>
      <img src = {pokemon.image_url} height="50" width="auto"/>
      {pokemon.name}
    </Link>
  </li>
);

export default PokemonIndexItem;
