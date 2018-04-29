class Wordrepo < ApplicationRecord
  belongs_to :wordlist
  belongs_to :word
end
