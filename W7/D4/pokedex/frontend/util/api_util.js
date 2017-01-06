export const fetchAllPokemon = () => (
  $.ajax({
    method: 'GET',
    url: 'api/pokemon'
  })
);

export const fetchPokemon = (pokemon_id) => (
  $.ajax({
    method: 'GET',
    url: `api/pokemon/${pokemon_id}`
  })
);

export const createPokemon = (pokemon) => (
  $.ajax({
    method: 'POST',
    url: `api/pokemon`,
    data: {
      pokemon: pokemon
    }
  })
);
