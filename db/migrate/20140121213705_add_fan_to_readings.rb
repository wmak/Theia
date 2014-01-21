class AddFanToReadings < ActiveRecord::Migration
  def change
    add_column :readings, :fan, :float
  end
end
