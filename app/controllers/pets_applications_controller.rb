class PetsApplicationsController < ApplicationController

  def update
    pet_application = PetsApplication.find(params[:id])
    application = pet_application.application
    pet_application.update(pet_application_params)
    application.pets.update(adoptable: false)
    redirect_to "/admin/applications/#{application.id}"
  end

  private
  def pet_application_params
    params.permit(:application_id, :pet_id, :pet_status)
  end
end