class CreateWordrepos < ActiveRecord::Migration[5.0]
  def change
    create_table :wordrepos do |t|
      t.references :wordlist, foreign_key: true
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
