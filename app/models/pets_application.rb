class PetsApplication < ApplicationRecord
  belongs_to :application
  belongs_to :pet

  # def self.adoptable?
  #   if pet.adoptable == false
  #     dont make application!
  #   end
  # end
end