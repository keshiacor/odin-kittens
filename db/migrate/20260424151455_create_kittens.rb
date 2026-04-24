class CreateKittens < ActiveRecord::Migration[8.1]
  def change
    create_table :kittens do |t|
      t.timestamps
    end
  end
end
