require "rails_helper"

RSpec.describe Application, type: :model do
  describe "relationships" do
    it { should have_many :pets_applications}
  end

  describe "instance methods" do 
    it "#find_pet_app" do
      @shelter_1 = Shelter.create(name: "Aurora shelter", city: "Aurora, CO", foster_program: false, rank: 9)
      @pet_1 = @shelter_1.pets.create(name: "Mr. Pirate", breed: "tuxedo shorthair", age: 5, adoptable: true)
      @joey = Application.create!(name: "Joey", address: "73 Shifty St", city: "Oakland", state: "MA", zip_code: "09342", description: "I'm a good people, totally not robot", status: "Pending" )
      @pet_app_1 = @joey.pets_applications.create!(pet_id: @pet_1.id)
      expect(@joey.find_pet_app(@pet_1.id)).to eq(@pet_app_1)
    end
  end
end