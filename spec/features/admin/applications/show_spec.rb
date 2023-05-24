require "rails_helper"

RSpec.describe "Admin Applications Show Page" do
  describe "As a visitor" do
    describe "When I visit the admin applications show page" do
   
      it "Has a button to approve the application for the specific pet" do
        @shelter_1 = Shelter.create(name: "Aurora shelter", city: "Aurora, CO", foster_program: false, rank: 9)
        @shelter_3 = Shelter.create(name: "Fancy pets of Colorado", city: "Denver, CO", foster_program: true, rank: 10)

        @pet_1 = @shelter_1.pets.create(name: "Mr. Pirate", breed: "tuxedo shorthair", age: 5, adoptable: true)
        @pet_2 = @shelter_1.pets.create(name: "Clawdia", breed: "shorthair", age: 3, adoptable: true)
        @pet_3 = @shelter_3.pets.create(name: "Lucille Bald", breed: "sphynx", age: 8, adoptable: true)
        @pet_4 = @shelter_1.pets.create(name: "Ann", breed: "ragdoll", age: 5, adoptable: true)

        @joey = Application.create!(name: "Joey", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "I'm a good people, totally not robot", status: "Pending" )
        @lars = Application.create!(name: "Lars Fredrickson", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "I'm a good people, totally not robot", status: "Pending" )
        @tim = Application.create!(name: "Tim Armstrong", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "Mohawk", status: "Rejected" )

        @pet_app_1 = @joey.pets_applications.create!(pet_id: @pet_1.id)
        @pet_app_3 = @tim.pets_applications.create!(pet_id: @pet_2.id)

        visit "/admin/applications/#{@joey.id}"

        click_button "Approve"
        expect(current_path).to eq("/admin/applications/#{@joey.id}")
        expect(page).to_not have_button("Approve")
        expect(page).to have_content("Approved")
      end

      it "Has a button to reject the application for the specific pet" do
        @shelter_1 = Shelter.create(name: "Aurora shelter", city: "Aurora, CO", foster_program: false, rank: 9)
        @shelter_3 = Shelter.create(name: "Fancy pets of Colorado", city: "Denver, CO", foster_program: true, rank: 10)

        @pet_1 = @shelter_1.pets.create(name: "Mr. Pirate", breed: "tuxedo shorthair", age: 5, adoptable: true)
        @pet_2 = @shelter_1.pets.create(name: "Clawdia", breed: "shorthair", age: 3, adoptable: true)
        @pet_3 = @shelter_3.pets.create(name: "Lucille Bald", breed: "sphynx", age: 8, adoptable: true)
        @pet_4 = @shelter_1.pets.create(name: "Ann", breed: "ragdoll", age: 5, adoptable: true)

        @joey = Application.create!(name: "Joey", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "I'm a good people, totally not robot", status: "Pending" )
        @lars = Application.create!(name: "Lars Fredrickson", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "I'm a good people, totally not robot", status: "Pending" )
        @tim = Application.create!(name: "Tim Armstrong", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "Mohawk", status: "Rejected" )

        @pet_app_1 = @joey.pets_applications.create!(pet_id: @pet_1.id)
        @pet_app_3 = @lars.pets_applications.create!(pet_id: @pet_2.id)

        visit "/admin/applications/#{@lars.id}"
        click_button "Reject"
        expect(current_path).to eq("/admin/applications/#{@lars.id}")
        expect(page).to_not have_button("Approve")
        expect(page).to_not have_button("Reject")
        expect(page).to have_content("Rejected")
      end

        # User Story 14
        # As a visitor
        # When there are two applications in the system for the same pet
        # When I visit the admin application show page for one of the applications
        # And I approve or reject the pet for that application
        # When I visit the other application's admin show page
        # Then I do not see that the pet has been accepted or rejected for that application
        # And instead I see buttons to approve or reject the pet for this specific application
        # Completed Applications
        # Once all pets on an application have been marked either accepted or rejected, then the application is no longer "Pending". If all the pets were accepted, then the application is "Accepted". If one or more pets on the application is rejected, then the entire application is "Rejected".

        it "Won't allow a pet to be adopted by two seperate applications" do 
          @shelter_1 = Shelter.create(name: "Aurora shelter", city: "Aurora, CO", foster_program: false, rank: 9)
          @shelter_3 = Shelter.create(name: "Fancy pets of Colorado", city: "Denver, CO", foster_program: true, rank: 10)
  
          @pet_1 = @shelter_1.pets.create(name: "Mr. Pirate", breed: "tuxedo shorthair", age: 5, adoptable: true)
          @pet_2 = @shelter_1.pets.create(name: "Clawdia", breed: "shorthair", age: 3, adoptable: true)
          @pet_3 = @shelter_3.pets.create(name: "Lucille Bald", breed: "sphynx", age: 8, adoptable: true)
          @pet_4 = @shelter_1.pets.create(name: "Ann", breed: "ragdoll", age: 5, adoptable: true)
  
          @joey = Application.create!(name: "Joey", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "I'm a good people, totally not robot", status: "Pending" )
          @lars = Application.create!(name: "Lars Fredrickson", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "I'm a good people, totally not robot", status: "Pending" )
          @tim = Application.create!(name: "Tim Armstrong", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "Mohawk", status: "Rejected" )
          @pet_app_1 = @joey.pets_applications.create!(pet_id: @pet_1.id)
          @pet_app_3 = @lars.pets_applications.create!(pet_id: @pet_1.id)


          visit "/admin/applications/#{@joey.id}"
          click_button "Approve"
          visit "/admin/applications/#{@lars.id}"

          expect(page).to_not have_button("Approve")
          expect(page).to_not have_button("Reject")
      end
    end
  end
end