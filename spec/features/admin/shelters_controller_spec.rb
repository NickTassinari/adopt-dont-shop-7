require "rails_helper"

RSpec.describe Admin::SheltersController, type: :controller do
  describe "As an admin" do
    describe "When I visit the shelters page" do
      it "lists the shelters in reverse alphabetical order by name" do
        shelter1 = Shelter.create!(foster_program: true, name: "Do Again Pets", city: "Barne", rank: 1)
        shelter2 = Shelter.create!(foster_program: true, name: "Rickys used pets", city: "Sunnyvale", rank: 1)
        shelter3 = Shelter.create!(foster_program: true, name: "Not Ricky's re-used pets", city: "Orange", rank: 1)


        get :index

        expect(shelter2.name).to appear_before(shelter3.name)
        expect(shelter3.name).to appear_before(shelter1.name)
      end
    end
  end
end