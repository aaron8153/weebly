class CreateTitleContents < ActiveRecord::Migration
  def change
    create_table :title_contents do |t|
      t.integer :content_id
      t.string :title

      t.timestamps
    end
  end
end
