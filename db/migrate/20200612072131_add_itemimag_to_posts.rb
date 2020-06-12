class AddItemimagToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :itemimag, :string
  end
end
