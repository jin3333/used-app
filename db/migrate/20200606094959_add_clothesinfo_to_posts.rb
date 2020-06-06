class AddClothesinfoToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :clothesinfo, :text
  end
end
