class TitleContent < ActiveRecord::Base
  has_one :element, as: :content
  # element_id, title
end
