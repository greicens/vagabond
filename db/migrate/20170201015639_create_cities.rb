class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :description
      t.has_many :users
      t.has_many :posts

      t.timestamps
    end
  end
end
