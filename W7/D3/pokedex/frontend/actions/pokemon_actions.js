import { fetchAllPokemon } from '../util/api_util';
import * as APIUtil from '../util/api_util';
//only need one above

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";

// Sync actions
export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

// Async actions === thunk action creators
export const requestAllPokemon = () => (dispatch) => {
  return APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)));
};
