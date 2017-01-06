json.extract! pokemon, :id, :name, :attack, :defense, :poke_type, :moves, :image_url

json.items pokemon.items do |item|
  json.extract! item, :id, :name, :pokemon_id, :price, :happiness, :image_url
end
