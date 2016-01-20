class Element < ActiveRecord::Base
  belongs_to :page
  belongs_to :content, polymorphic: true
end


# t.string :content_type
# t.integer :content_id
# t.integer :page_id