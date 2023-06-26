# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

user = User.new(email: "admin@correo.cl", name: "Admin", username: "Admin", role: 1, password: "123456", password_confirmation: "123456")
image_file = URI.open('https://karipic3.s3.amazonaws.com/fotop2.jpg')
user.image.attach(io: image_file, filename: 'fotop2.jpg')
user.save

user = User.new(email: "correo@correo.cl", name: "correo1", username: "correo1", role: 0, password: "123456", password_confirmation: "123456")
image_file = URI.open('https://karipic3.s3.amazonaws.com/fotop1.jpg')
user.image.attach(io: image_file, filename: 'fotop1.jpg')
user.save

10.times do
    User.create( email: Faker::Internet.email, username: Faker::Name.name, password: "123456", password_confirmation: "123456", skill: Faker::Job.key_skills(3), experience: Faker::Job.title, schooling: Faker::Educator.degree, current_role: Faker::Job.position)
  end

10.times do |i|
    Position.create(title: Faker::Job.title, description: Faker::Lorem.paragraph, responsibilities: Faker::Lorem.paragraph, requirements: Faker::Lorem.paragraph, salary: Faker::Number.between(from: 30000, to: 100000))
end

positions = Position.all
users = User.all

5.times do
    position = positions.sample
    user = users.sample
  
    next if user.positions.exists?(position.id)  
   
    user.positions << position
end