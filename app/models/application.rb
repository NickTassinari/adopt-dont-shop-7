class Application < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip_code, :description
  has_many :pets_applications
  has_many :pets, through: :pets_applications

  def find_pet_app(pet_id)
    pets_applications.where(pet_id: pet_id).first
  end
end