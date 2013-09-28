json.array!(@st_users) do |st_user|
  json.extract! st_user, :name, :height, :weight, :sex, :total_calorie_in, :total_calorie_out
  json.url st_user_url(st_user, format: :json)
end
