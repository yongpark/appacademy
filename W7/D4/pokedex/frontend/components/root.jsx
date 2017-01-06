import React from 'react';
import {Provider} from 'react-redux';
import { Router, Route, hashHistory, IndexRoute } from 'react-router';

import PokemonIndexContainer from './pokemon/pokemon_index_container';
import PokemonDetailContainer from './pokemon/pokemon_detail_container';
import ItemDetailContainer from './item/item_detail_container';
import PokemonFormContainer from './pokemon/pokemon_form_container';

import { requestSinglePokemon, requestAllPokemon } from '../actions/pokemon_actions';

const Root = ({store}) => {
  const _fetchSinglePokemon = (nextState) => store.dispatch(requestSinglePokemon(nextState.params.pokemonId));

  const _fetchAllPokemon = (nextState) => store.dispatch(requestAllPokemon());

  return (
    <Provider store={store}>
      <Router history={hashHistory}>
        <Route path="/" component={PokemonIndexContainer} onEnter={_fetchAllPokemon}>
          <IndexRoute component={PokemonFormContainer}/>
          <Route path="pokemon/:pokemonId" component={PokemonDetailContainer} onEnter={_fetchSinglePokemon}>
            <Route path="item/:itemId" component={ItemDetailContainer}/>
          </Route>
        </Route>
      </Router>
    </Provider>
  );
};

export default Root;
