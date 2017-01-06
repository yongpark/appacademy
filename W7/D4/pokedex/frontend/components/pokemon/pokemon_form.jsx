import React from 'react';
import {withRouter} from 'react-router';

class PokemonForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      name: '',
      attack: '',
      defense: '',
      image_url: '',
      moves:['sleep'],
      poke_type: ''
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.update = this.update.bind(this);
    this.errors = this.errors.bind(this);

    this.types = [
      "fire",
      "electric",
      "normal",
      "ghost",
      "psychic",
      "water",
      "bug",
      "dragon",
      "grass",
      "fighting",
      "ice",
      "flying",
      "poison",
      "ground",
      "rock",
      "steel"
    ];
  }


  handleSubmit() {
    event.preventDefault();
    this.props.createPokemon(this.state)
      .then((newPokemon) => {
        this.props.router.push(`pokemon/${newPokemon.id}`);
      });
  }

  update(property) {
    return e => this.setState({[property]: e.target.value});
  }

  errors(){
    if (this.props.errors.length !== 0) {
      const errs = this.props.errors.responseJSON;

      return Object.keys(errs).map((key, index) => {
        return (<li>{errs[key]}</li>);
      });
    }
  }

  render() {

    const poketypes = this.types.map(type => (
      <option value={type}>{type}</option>
    ));


    return (
      <form onSubmit={this.handleSubmit}>
        <input onChange={this.update('name')}
               value={this.state.name}
               placeholder='Name'/><br/>

        <input onChange={this.update('attack')}
          value={this.state.attack}
          placeholder='Attack'/><br/>

        <input onChange={this.update('defense')}
          value={this.state.defense}
          placeholder='Defense'/><br/>

        <input onChange={this.update('image_url')}
          value={this.state.image_url}
          placeholder='Image Url'/><br/>

        <select onChange={this.update('poke_type')}
          value={this.state.poke_type}
          placeholder='Poke Type'>
          {poketypes}
        </select>

        <br/>

        <button>Create Pokemon</button>
        {this.errors()};
      </form>
    );
  }
}

export default withRouter(PokemonForm);
