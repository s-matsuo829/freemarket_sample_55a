class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :postalcode,    null: false
      t.string :prefecture,    null: false
      t.string :city,          null: false
      t.string :number,        null: false
      t.string :building
      t.string :phone_number,  unique: true
      t.references :user,      null: false
      t.timestamps
    end
  end
end
