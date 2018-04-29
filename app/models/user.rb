class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :gen_pocket_list
  has_many :wordlists
  has_many :words
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def gen_pocket_list
    puts "I am in gen pocket list"
    puts self
    puts "Printed user"
    puts self.id
    wp= Wordlist.new
    wp.user_id= self.id
    wp.name="My PocketList"
    wp.save
  end

end
