class AddWordhistToWord < ActiveRecord::Migration[5.0]
  def change
    add_column :words, :hitcount, :integer, default: 0
  end
end
