import { values } from 'lodash';

export const selectAllPokemon = (state) => {
  return values(state.pokemon);
};

export const selectPokemonItem = (state, itemId) => {

  const items = state.pokemonDetail.items;

  for (let i = 0; i < items.length; i++) {
    if (items[i].id === parseInt(itemId)) {
      console.log(items[i]);
      return items[i];
    }
  }
};
