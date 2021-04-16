# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = User.new(email: 'a@gmail.com', password: 'a@gmail.com')
a.add_role "admin"
a.control_number= 1
a.name="asd"
a.lasname="dsa"
a.save!