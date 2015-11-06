json.repairs @repairs do |r|
  json.id r.id
  json.name r.tenant.name
  json.description r.description
  json.building r.tenant.building
  json.unit r.tenant.unit
  json.submitted_at r.submitted_at
  if r.completed_at != nil
    json.completed_at r.completed_at
  end
end

# (r, :id, :tenant, :description)
