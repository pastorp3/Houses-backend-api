class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.string :title
      t.text :address
      t.integer :rent_price
      t.text :description
      t.integer :raiting
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
