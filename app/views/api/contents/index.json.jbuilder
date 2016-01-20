json.array!(@contents) do |content|
  json.extract! content, :id, :element_id
  json.url content_url(content, format: :json)
end
