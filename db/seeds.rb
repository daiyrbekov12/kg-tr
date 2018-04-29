# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new
user.email = 'admin@admin.com'
user.role='admin'
user.password = 'password'
user.password_confirmation = 'password'

if User.find_by_email(user.email)==nil
 user.save
end

Languages=["Kg-Tr", "Tr-Kg"]

Languages.each do |language|
  Language.find_or_create_by({name: language})
end


category = ['General','Edabiya','Sport','Music']
category.each do |category|
	Category.create(category: category)
end

vna = ['verb','noun','adjective']
vna.each do |vna|
	Vna.create(name: vna)
end

for i in 1..20 do
  new_word = Word.new
  new_word.language=Language.find(i%2+1)
  new_word.word = Faker::Name.first_name
  new_word.translation = Faker::Name.last_name
  new_word.definition = Faker::Name.title
  new_word.category = Category.find(i%4+1)
  new_word.vna = Vna.find(i%3+1)
  new_word.save
end
