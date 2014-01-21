class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.float :fan
      t.float :temp

      t.timestamps
    end
  end
end
