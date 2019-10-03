class AnotherMigration < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :seats_sold, :integer
  end
end
