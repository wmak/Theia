class RenameReadingToTemperatures < ActiveRecord::Migration
  def change
  	rename_table :readings, :temperatures
  end
end
