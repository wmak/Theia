class AddReadingToLog < ActiveRecord::Migration
  def change
  	add_column :logs, :reading, :string
  end
end
