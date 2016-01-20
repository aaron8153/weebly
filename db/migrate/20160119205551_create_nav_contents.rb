class CreateNavContents < ActiveRecord::Migration
  def change
    create_table :nav_contents do |t|

      t.timestamps
    end
  end
end
