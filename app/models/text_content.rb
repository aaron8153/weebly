class TextContent < ActiveRecord::Base
  has_one :element, as: :content
end
