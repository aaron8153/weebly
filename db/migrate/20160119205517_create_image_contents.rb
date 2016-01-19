class CreateImageContents < ActiveRecord::Migration
  def change
    create_table :image_contents do |t|
      t.integer :content_id
      t.string :uri
      t.string :target

      t.timestamps
    end
  end
end
