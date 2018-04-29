class Word < ApplicationRecord
  searchkick callbacks: :async
  belongs_to :language
  belongs_to :category
  belongs_to :vna
  has_many :wordrepos
  has_many :wordlists , :through=> :wordrepos
  validates :word, presence: true
  validates :translation, presence: true
  mount_uploader :audio, AudioUploader
end
