class AddDetailsToKitten < ActiveRecord::Migration[8.1]
  def change
    add_column :kittens, :name, :string
    add_column :kittens, :age, :decimal
    add_column :kittens, :cuteness, :string
    add_column :kittens, :softness, :string
  end
end
