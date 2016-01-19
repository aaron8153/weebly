class RemoveTargetFromImageContent < ActiveRecord::Migration
  def change
    remove_column :image_contents, :target
  end
end
