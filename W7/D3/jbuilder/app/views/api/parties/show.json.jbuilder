json.partial! 'api/parties/party', party: @party

json.guests @party.guests do |guest|
  json.name guest.name
  json.age guest.age
  json.favorite_color guest.favorite_color

  json.gifts guest.gifts do |gift|
    json.description gift.description
    json.title gift.title
  end
end
