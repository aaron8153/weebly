class CreateTitleContents < ActiveRecord::Migration
  def change
    create_table :title_contents do |t|
      t.string :title

      t.timestamps
    end
  end
end
