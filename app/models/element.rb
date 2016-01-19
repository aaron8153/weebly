class Element < ActiveRecord::Base
  belongs_to :page
  has_one :content
end
