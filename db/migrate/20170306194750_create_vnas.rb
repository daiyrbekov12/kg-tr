class CreateVnas < ActiveRecord::Migration[5.0]
  def change
    create_table :vnas do |t|
      t.string :name
      t.timestamps
    end
  end
end
