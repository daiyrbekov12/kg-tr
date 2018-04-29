class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.references :language, foreign_key: true
      t.references :vna, foreign_key: true
      t.string  :word
      t.string  :translation
      t.text 	:definition
      t.integer :range, default: 0

      t.timestamps
    end
  end
end
