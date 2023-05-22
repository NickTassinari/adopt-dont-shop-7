require "rails_helper"

RSpec.describe "Admin shelters index page" do
  describe "As an visitor" do
    describe "When I visit the admin shelters page" do

      # user story 10

      it "lists the shelters in reverse alphabetical order by name" do
        shelter1 = Shelter.create!(foster_program: true, name: "Do Again Pets", city: "Barne", rank: 1)
        shelter2 = Shelter.create!(foster_program: true, name: "Rickys used pets", city: "Sunnyvale", rank: 1)
        shelter3 = Shelter.create!(foster_program: true, name: "Not Ricky's re-used pets", city: "Orange", rank: 1)


        visit "/admin/shelters"

        expect(shelter2.name).to appear_before(shelter3.name)
        expect(shelter3.name).to appear_before(shelter1.name)
      end

      # user story 11

      it "returns the pending applications" do
        @shelter_1 = Shelter.create(name: "Aurora shelter", city: "Aurora, CO", foster_program: false, rank: 9)
        @shelter_2 = Shelter.create(name: "RGV animal shelter", city: "Harlingen, TX", foster_program: false, rank: 5)
        @shelter_3 = Shelter.create(name: "Fancy pets of Colorado", city: "Denver, CO", foster_program: true, rank: 10)

        @pet_1 = @shelter_1.pets.create(name: "Mr. Pirate", breed: "tuxedo shorthair", age: 5, adoptable: false)
        @pet_2 = @shelter_1.pets.create(name: "Clawdia", breed: "shorthair", age: 3, adoptable: true)
        @pet_3 = @shelter_3.pets.create(name: "Lucille Bald", breed: "sphynx", age: 8, adoptable: true)
        @pet_4 = @shelter_1.pets.create(name: "Ann", breed: "ragdoll", age: 5, adoptable: true)

        @joey = Application.create!(name: "Joey", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "I'm a good people, totally not robot", status: "Pending" )
        @lars = Application.create!(name: "Lars Fredrickson", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "I'm a good people, totally not robot", status: "Pending" )
        @matt = Application.create!(name: "Matt Freeman", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "I'm a good people, totally not robot", status: "In Progress" )
        @tim = Application.create!(name: "Tim Armstrong", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "Mohawk", status: "Rejected" )

        @pet_app_1 = @joey.pets_applications.create!(pet_id: @pet_1.id, pet_status: @pet_1.adoptable)
        @pet_app_3 = @tim.pets_applications.create!(pet_id: @pet_2.id,pet_status: @pet_2.adoptable)

        visit "/admin/shelters"

        within "#pending_shelters" do
          expect(page).to have_content(@shelter_1.name)
          expect(page).to_not have_content(@shelter_3.name)
          save_and_open_page
        end
      end
    end
  end
end