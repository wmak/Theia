class RemoveFanFromReadings < ActiveRecord::Migration
  def change
    remove_column :readings, :fan, :integer
  end
end
