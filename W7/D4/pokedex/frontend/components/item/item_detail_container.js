import { connect } from 'react-redux';
import { selectPokemonItem } from '../../reducers/selectors';
import ItemDetail from './item_detail';

const mapStateToProps = (state, ownProps) => ({
  item: selectPokemonItem(state, ownProps.params.itemId)
});

export default connect(
  mapStateToProps,
  null
)(ItemDetail);
