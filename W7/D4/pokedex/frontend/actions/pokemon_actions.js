import { fetchAllPokemon,
         fetchPokemon } from '../util/api_util';
import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_POKEMON = "RECEIVE_POKEMON";
export const CREATE_POKEMON = "CREATE_POKEMON";
export const RECEIVE_POKEMON_ERRORS = "RECEIVE_POKEMON_ERRORS";

// Sync actions
export const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const receivePokemon = (pokemon) => ({
  type: RECEIVE_POKEMON,
  pokemon
});

export const createPokemon = (pokemon) => ({
  type: CREATE_POKEMON,
  pokemon
});

export const receivePokemonErrors = (errors) => ({
  type: RECEIVE_POKEMON_ERRORS,
  errors
});

// Async actions === thunk action creators
export const requestAllPokemon = () => (dispatch) => {
  return APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)));
};

export const requestSinglePokemon = (pokemonId) => (dispatch) => {
  return APIUtil.fetchPokemon(pokemonId)
    .then(pokemon => dispatch(receivePokemon(pokemon)));
};

export const requestCreatePokemon = (pokemon) => (dispatch) => (
  APIUtil.createPokemon(pokemon)
    .then(poke => {
      dispatch(createPokemon(poke));
      return poke;
    }).fail(errors => {
      dispatch(receivePokemonErrors(errors));
      return errors;
    })
);
