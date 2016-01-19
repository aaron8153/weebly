class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.string :type
      t.integer :page_id

      t.timestamps
    end
  end
end
