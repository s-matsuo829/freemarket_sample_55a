class CreateTradings < ActiveRecord::Migration[5.2]
  def change
    create_table :tradings do |t|
      t.references :item, null: false
      t.integer :status,	null: false
      t.integer :rating	
      t.references :buyer, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
