json.array!(@users) do |user|
  json.extract! user, :id, :username, :picture
  json.url user_url(user, format: :json)
end
