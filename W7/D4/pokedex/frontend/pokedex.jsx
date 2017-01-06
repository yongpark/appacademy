import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

import { fetchAllPokemon, fetchPokemon } from './util/api_util';
import { requestAllPokemon, requestSinglePokemon, requestCreatePokemon } from './actions/pokemon_actions';
import { selectAllPokemon } from './reducers/selectors';

document.addEventListener("DOMContentLoaded", ()=> {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  ReactDOM.render(<Root store={store}/>, rootEl);

  window.store = store;
  window.fetchAllPokemon = fetchAllPokemon;
  window.fetchPokemon = fetchPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.selectAllPokemon = selectAllPokemon;
  window.requestSinglePokemon = requestSinglePokemon;
  window.requestCreatePokemon = requestCreatePokemon;
});


// TODO: FOR TESTING PURPOSES

// $.ajax({
//   method: 'POST',
//   url: `api/pokemon`,
//   data: {
//     pokemon: {
//       name: 'john',
//       attack: '5000',
//       defense: '1',
//       image_url: '/assets/pokemon_snaps/139.svg',
//       moves:["sleep"],
//       poke_type: 'fire'
//     }
//   }
// });
