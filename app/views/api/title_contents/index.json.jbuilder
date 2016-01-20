json.array!(@title_contents) do |title_content|
  json.extract! title_content, :id, :content_id, :title
  json.url title_content_url(title_content, format: :json)
end
