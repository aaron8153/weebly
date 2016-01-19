json.array!(@nav_contents) do |nav_content|
  json.extract! nav_content, :id, :content_id
  json.url nav_content_url(nav_content, format: :json)
end
