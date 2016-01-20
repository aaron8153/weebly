class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.string :content_type
      t.integer :content_id
      t.integer :page_id

      t.timestamps
    end
    add_index :elements, :content_type
    add_index :elements, :content_id
    add_index :elements, :page_id
  end
end
