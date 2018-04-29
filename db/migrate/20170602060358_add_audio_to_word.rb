class AddAudioToWord < ActiveRecord::Migration[5.0]
  def change
    add_column :words, :audio, :string
  end
end
