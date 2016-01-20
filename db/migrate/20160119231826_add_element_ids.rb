class AddElementIds < ActiveRecord::Migration
  def change
    add_column :title_contents, :element_id, :integer
    add_column :text_contents, :element_id, :integer
    add_column :image_contents, :element_id, :integer
    add_column :nav_contents, :element_id, :integer
  end
end
