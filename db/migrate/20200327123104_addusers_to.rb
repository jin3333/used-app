class AddusersTo < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :url, :text
  end
end
