PetsApplication.destroy_all
Pet.destroy_all
Application.destroy_all
VeterinaryOffice.destroy_all
Veterinarian.destroy_all
Shelter.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@joey = Application.create!(name: "Joey", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "I'm a good people, totally not robot", status: "Pending" )

shelter = Shelter.create!(foster_program: true, name: "Rickys used pets", city: "Sunnyvale", rank: 1)
zappa = shelter.pets.create!(adoptable: true, age: 4, breed: "poodle", name: "Francesco Zappa")
d_zappa = shelter.pets.create!(adoptable: true, age: 2, breed: "mini poodle", name: "Droolzle Zappa")
bowser = shelter.pets.create!(adoptable: true, age: 4, breed: "big chonk", name: "Bowser")
l_bowser = shelter.pets.create!(adoptable: true, age: 2, breed: "lil chonk", name: "Little Bowser")

@shelter1 = Shelter.create!(foster_program: true, name: "Do Again Pets", city: "Barne", rank: 1)
@shelter2 = Shelter.create!(foster_program: true, name: "Rickys used pets", city: "Sunnyvale", rank: 1)
@shelter3 = Shelter.create!(foster_program: true, name: "Not Ricky's re-used pets", city: "Orange", rank: 1)

@joey = Application.create!(name: "Joey", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "I'm a good people, totally not robot", status: "Pending" )
@lars = Application.create!(name: "Lars Fredrickson", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "I'm a good people, totally not robot", status: "Pending" )
@matt = Application.create!(name: "Matt Freeman", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "I'm a good people, totally not robot", status: "In Progress" )
@tim = Application.create!(name: "Tim Armstrong", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "Mohawk", status: "Rejected" )

# @pet_1 = @shelter_1.pets.create(name: "Mr. Pirate", breed: "tuxedo shorthair", age: 5, adoptable: true)
#           @pet_2 = @shelter_1.pets.create(name: "Clawdia", breed: "shorthair", age: 3, adoptable: true)
#           @pet_3 = @shelter_3.pets.create(name: "Lucille Bald", breed: "sphynx", age: 8, adoptable: true)
#           @pet_4 = @shelter_1.pets.create(name: "Ann", breed: "ragdoll", age: 5, adoptable: true)
  
@pet_app_1 = @joey.pets_applications.create!(pet_id: zappa.id, pet_status: zappa.adoptable)