class RenameItemColumnToItemId < ActiveRecord::Migration[5.2]
  def change
    rename_column :likes, :item, :item_id
  end
end
