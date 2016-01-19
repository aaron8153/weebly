class CreateNavPoints < ActiveRecord::Migration
  def change
    create_table :nav_points do |t|
      t.integer :nav_content_id
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
