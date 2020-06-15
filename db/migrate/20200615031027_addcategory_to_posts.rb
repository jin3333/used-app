class AddcategoryToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column t.references :category,  foreign_key: true
  end
end
