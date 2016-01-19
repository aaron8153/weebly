json.array!(@image_contents) do |image_content|
  json.extract! image_content, :id, :content_id, :uri, :target
  json.url image_content_url(image_content, format: :json)
end
