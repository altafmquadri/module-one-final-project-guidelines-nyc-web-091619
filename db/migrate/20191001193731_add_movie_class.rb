class AddMovieClass < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.float :price
      t.integer :capacity
    end
  end
end
