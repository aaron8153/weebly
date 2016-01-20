class ImageContent < ActiveRecord::Base
  belongs_to :element
  # content_id, uri
end
