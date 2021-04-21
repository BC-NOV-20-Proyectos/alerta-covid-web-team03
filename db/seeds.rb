# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

institution  = Institution.new(description: 'Apple')
institution.save!

area = Area.new(description: 'RoR')
area.institution = institution
area.save!

user = User.new(email: 'a@gmail.com', password: 'a@gmail.com')
user.add_role "admin"
user.control_number= 1
user.name="asd"
user.lasname="dsa"
user.institution = institution
user.area = area
user.save!