class AddBrandToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :brand, :string
  end
end
