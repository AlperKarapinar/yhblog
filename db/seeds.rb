# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#    = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Daley', city: cities.first)

User.create(first_name: 'aa', last_name: 'bb', email:'a@b.com', password:'123456', password_confirmation:'123456', admin:true, author:true, active:false)
