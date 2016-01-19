class CreateNavContents < ActiveRecord::Migration
  def change
    create_table :nav_contents do |t|
      t.integer :content_id

      t.timestamps
    end
  end
end
