json.array!(@text_contents) do |text_content|
  json.extract! text_content, :id, :content_id, :text
  json.url text_content_url(text_content, format: :json)
end
