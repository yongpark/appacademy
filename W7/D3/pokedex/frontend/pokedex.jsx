import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

import { fetchAllPokemon } from './util/api_util';
import { requestAllPokemon } from './actions/pokemon_actions';
import { selectAllPokemon } from './reducers/selectors';

document.addEventListener("DOMContentLoaded", ()=> {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  ReactDOM.render(<Root store={store}/>, rootEl);

  window.store = store;
  window.fetchAllPokemon = fetchAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.selectAllPokemon = selectAllPokemon;
});
