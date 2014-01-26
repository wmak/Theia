class CreateProcessors < ActiveRecord::Migration
  def change
    create_table :processors do |t|
      t.float :cpu

      t.timestamps
    end
  end
end
