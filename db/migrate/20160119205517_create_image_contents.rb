class CreateImageContents < ActiveRecord::Migration
  def change
    create_table :image_contents do |t|
      t.string :uri

      t.timestamps
    end
  end
end
