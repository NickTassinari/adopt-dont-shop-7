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
    end
  end
end