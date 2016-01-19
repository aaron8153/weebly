class FixTypeColumn < ActiveRecord::Migration
  def change
    rename_column :elements, :type, :content_type
  end
end
