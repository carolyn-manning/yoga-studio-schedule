# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Teacher.create(first_name:"Jane", last_name:"Doe", bio:"Lorem ipsum dolor sit amet, sint decore voluptatum nam ei, his magna quodsi deseruisse ne, mea atqui aeque torquatos an. Sed cu prima maluisset constituto. Vel tamquam recteque te, melius dolorem phaedrum nec ei. Vim lucilius perfecto iracundia ea.
")
Teacher.create(first_name:"John", last_name:"Doe", bio:"Lorem ipsum dolor sit amet, sint decore voluptatum nam ei, his magna quodsi deseruisse ne, mea atqui aeque torquatos an. Sed cu prima maluisset constituto. Vel tamquam recteque te, melius dolorem phaedrum nec ei. Vim lucilius perfecto iracundia ea.
")
Style.create(name:"Style 1", description: "Test Description")
Style.create(name:"Style 2", description: "Test Description")
User.create(first_name:"Studio Admin", last_name:"Test", password:"password", email:"testadmin@test.com", admin:true)
