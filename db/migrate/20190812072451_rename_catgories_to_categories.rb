class RenameCatgoriesToCategories < ActiveRecord::Migration[5.2]
  def change
    rename_table :catgories, :categories
  end
end
