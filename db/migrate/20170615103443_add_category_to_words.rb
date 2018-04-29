class AddCategoryToWords < ActiveRecord::Migration[5.0]
  def change
    add_reference :words, :category, foreign_key: true
  end
end
