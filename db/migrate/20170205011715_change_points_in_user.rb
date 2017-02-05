class ChangePointsInUser < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :points, :integer, default: 15
  end
end
