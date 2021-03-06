# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do |n|
  Book.create(title:Faker::Book.title,author:Faker::Book.author,publisher: Faker::Book.publisher, genre: Faker::Book.genre)
end

10.times do |i|
    Post.create(title: "Post #{i+1}", body: Faker::Lorem.paragraph(sentence_count: 500))
end

1000.times do |i|
  Listing.create(name: Faker::Restaurant.name)
end
