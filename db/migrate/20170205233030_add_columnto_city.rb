class AddColumntoCity < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :photo, :string
  end
end
