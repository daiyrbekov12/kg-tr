class Wordlist < ApplicationRecord
  belongs_to :user
  has_many :wordrepos
  has_many :words, :through=> :wordrepos
end
