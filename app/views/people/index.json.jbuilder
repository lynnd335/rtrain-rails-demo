json.array!(@people) do |person|
  json.extract! person, :id, :name, :address, :phone, :email_address, :about
  json.url person_url(person, format: :json)
end
