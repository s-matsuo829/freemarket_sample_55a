class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :image, null: false
      t.string :name, null: false, index: true
      t.text :description, null: false
      t.integer :item_status,	null: false
      t.integer	:payment,	null: false
      t.integer :delivery_type,	null: false
      t.integer :delivery_region,	null: false
      t.integer	:delivery_days,	null: false
      t.integer	:price,	null: false
      t.integer :size
      t.references :user, null: false
      # TO DO カテゴリーテーブルを作る場合は記入
      # t.references :category
      t.timestamps 
    end
  end
end
