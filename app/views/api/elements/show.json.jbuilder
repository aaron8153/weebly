json.extract! @element, :id, :content_type, :page_id, :created_at, :updated_at
case @element.content_type
  when 'TitleContent'
    json.extract! @element.content, :id, :title, :created_at, :updated_at
  when 'TextContent'
    json.extract! @element.content, :id, :text, :created_at, :updated_at
  when 'ImageContent'
    json.extract! @element.content, :id, :uri, :created_at, :updated_at
  when 'NavContent'
    #blah
end