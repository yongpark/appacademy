json.array! @parties do |party|
  json.partial! 'api/parties/party', party: party

  json.guests party.guests do |guest|
    json.name guest.name
    json.age guest.age
    json.favorite_color guest.favorite_color
  end
end
