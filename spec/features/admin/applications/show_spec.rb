require "rails_helper"

RSpec.describe "Admin Applications Show Page" do 
  describe "As a visitor" do 
    describe "When I visit the admin applications show page" do 
    #   Approving a Pet for Adoption
    #   As a visitor When I visit an admin application show page ('/admin/applications/:id') For every pet that the application is for, 
    #   I see a button to approve the application for that specific pet When I click that button Then I'm taken back to the admin application show page And next to the pet that I approved, 
    #   I do not see a button to approve this pet And instead I see an indicator next to the pet that they have been approved [ ] done
      it "Has a button to approve the application for the specific pet" do 
        @shelter_1 = Shelter.create(name: "Aurora shelter", city: "Aurora, CO", foster_program: false, rank: 9)
        @shelter_3 = Shelter.create(name: "Fancy pets of Colorado", city: "Denver, CO", foster_program: true, rank: 10)

        @pet_1 = @shelter_1.pets.create(name: "Mr. Pirate", breed: "tuxedo shorthair", age: 5, adoptable: false)
        @pet_2 = @shelter_1.pets.create(name: "Clawdia", breed: "shorthair", age: 3, adoptable: true)
        @pet_3 = @shelter_3.pets.create(name: "Lucille Bald", breed: "sphynx", age: 8, adoptable: true)
        @pet_4 = @shelter_1.pets.create(name: "Ann", breed: "ragdoll", age: 5, adoptable: true)

        @joey = Application.create!(name: "Joey", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "I'm a good people, totally not robot", status: "Pending" )
        @lars = Application.create!(name: "Lars Fredrickson", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "I'm a good people, totally not robot", status: "Pending" )
        @tim = Application.create!(name: "Tim Armstrong", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "Mohawk", status: "Rejected" )

        @pet_app_1 = @joey.pets_applications.create!(pet_id: @pet_1.id, pet_status: @pet_1.adoptable)
        @pet_app_3 = @tim.pets_applications.create!(pet_id: @pet_2.id,pet_status: @pet_2.adoptable)

        visit "/admin/applications/#{@joey.id}"

        click_button "Approve Application"
        expect(current_path).to eq("/admin/applications/#{@joey.id}")
        expect(page).to_not have_content("Approve Application")
        expect(page).to have_content("Application Approved")
      end
    end
  end
end