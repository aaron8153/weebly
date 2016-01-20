class Element < ActiveRecord::Base
  belongs_to :page
  has_one :title_content
  has_one :text_content
  has_one :image_content
  has_one :nav_content
end
