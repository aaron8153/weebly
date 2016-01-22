json.array!(@elements) do |element|
  json.extract! element, :id, :content_type, :page_id
  json.url api_page_element_url(:page_id, element, format: :json)
end