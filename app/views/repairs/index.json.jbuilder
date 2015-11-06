json.repairs @repairs do |r|
  json.(p, :id, :name, :description)
  json.price display_price(p)
end
