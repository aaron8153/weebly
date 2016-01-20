class NavContent < ActiveRecord::Base
  belongs_to :element
  has_many :nav_points
  #content_id
end
