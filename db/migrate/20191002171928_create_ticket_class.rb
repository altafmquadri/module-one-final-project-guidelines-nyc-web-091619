class CreateTicketClass < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :movie_id
      t.integer :seat_number
    end
  end
end
