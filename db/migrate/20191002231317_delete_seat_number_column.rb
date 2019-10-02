class DeleteSeatNumberColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :seat_number
  end
end
