json.array!(@elements) do |element|
  json.extract! element, :id, :content_type, :page_id
  json.url element_url(element, format: :json)
end
