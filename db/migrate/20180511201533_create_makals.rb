class CreateMakals < ActiveRecord::Migration[5.0]
  def change
    create_table :makals do |t|
      t.string  :kg
      t.string  :tr
      t.string  :description

      t.timestamps
    end
  end
end
