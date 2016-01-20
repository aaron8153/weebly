class CreateTextContents < ActiveRecord::Migration
  def change
    create_table :text_contents do |t|
      t.integer :content_id
      t.text :text

      t.timestamps
    end
  end
end
