json.array!(@calories) do |calory|
  json.extract! calory, :intake, :outtake
  json.url calory_url(calory, format: :json)
end
