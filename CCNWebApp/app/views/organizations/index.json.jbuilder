json.array!(@organizations) do |organization|
  json.extract! organization, :name, :location, :discription
  json.url organization_url(organization, format: :json)
end
