class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string  :name
      t.integer :price
      t.integer :saler_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end
