import React from 'react';
import { Link } from 'react-router';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);

    this.displayMoves = this.displayMoves.bind(this);
    this.displayItems = this.displayItems.bind(this);
  }

  displayMoves() {
    if (Object.keys(this.props.pokemon).length !== 0) {
      return this.props.pokemon.moves.join(', ');
    }
  }

  displayItems() {
    if (Object.keys(this.props.pokemon).length !== 0) {
      const items = Object.values(this.props.pokemon.items);
      return items.map((item, i) => (
        <Link to={`/pokemon/${this.props.pokemon.id}/item/${item.id}`}>
          <li key={i}>
            <img src={item.image_url}/>
          </li>
        </Link>
      ));
    }
  }

  render() {
    const { name, poke_type, attack, defense, moves } = this.props.pokemon;

    return (
      <section>
        <h4>{name}</h4>
        <h5>Type: {poke_type}</h5>
        <h5>Attack: {attack}</h5>
        <h5>Defense: {defense}</h5>
        <h5>Moves: {this.displayMoves()}</h5>
        <h5>Items:
          <ul>
            {this.displayItems()}
          </ul>
        </h5>

        {this.props.children}
      </section>
    );
  }
}

export default PokemonDetail;
