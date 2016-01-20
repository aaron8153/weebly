class ImageContent < ActiveRecord::Base
  has_one :element, as: :content
  # content_id, uri
end
