# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

teacher = Teacher.create(first_name: 'Severus', last_name: 'Snape', email: 'severus@howarts.com',
                         skills: %w[Magic Potions], password: :password, password_confirmation: :password)
teacher.courses.create(name: 'Potions Basic 1', description: 'Basic course about potions in Howarts', status: :active)

teacher = Teacher.create(first_name: 'Rolanda', last_name: 'Hooch', email: 'rolanda@howarts.com',
                         skills: %w[Magic Fly Quidditch], password: :password, password_confirmation: :password)
teacher.courses.create(name: 'Fly with Nimbus 2000', description: 'Basic course to fly with Nimbus 2000',
                       status: :active)
