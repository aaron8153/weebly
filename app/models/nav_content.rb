class NavContent < ActiveRecord::Base
  has_one :element, as: :content
  has_many :nav_points
  #content_id
end
