import { connect } from 'react-redux';

import { requestCreatePokemon } from '../../actions/pokemon_actions';
import PokemonForm from './pokemon_form';

const mapDispatchToProps = (dispatch) => ({
  createPokemon: (pokemon) => dispatch(requestCreatePokemon(pokemon))
});

const mapStateToProps = state => ({
  errors: state.errors
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonForm);
