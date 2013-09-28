json.array!(@donations) do |donation|
  json.extract! donation, 
  json.url donation_url(donation, format: :json)
end
