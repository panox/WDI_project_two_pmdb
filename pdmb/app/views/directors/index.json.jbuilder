json.array!(@directors) do |director|
  json.extract! director, :id, :name, :description, :country, :picture
  json.url director_url(director, format: :json)
end
