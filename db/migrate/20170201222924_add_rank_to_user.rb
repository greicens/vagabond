class AddRankToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :rank, :string
    add_column :users, :points, :integer
    add_column :users, :email, :string
    add_column :users, :password, :string
  end
end
