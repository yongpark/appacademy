import {RECEIVE_ALL_POKEMON, CREATE_POKEMON} from '../actions/pokemon_actions';
import {merge} from 'lodash';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type){
    case RECEIVE_ALL_POKEMON:
      return(merge({}, state, action.pokemon));
    case CREATE_POKEMON:
      const pokeId = action.pokemon.id;
      const newPokemon = {[action.pokemon.id]: action.pokemon};
      return(merge({}, state, newPokemon));
    default:
      return state;
  }
};

export default pokemonReducer;
