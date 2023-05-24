class Admin::ApplicationsController < ApplicationController
  def show
    @applications = Application.find(params[:id])
    @pets = @applications.pets
  end
  
  def update
    @applications = Application.find(params[:id])
    if params[:approval] == "approved"  
      @applications.update(status: "Approved")
      @applications.pets.update(adoptable: false)
      redirect_to "/admin/applications/#{@applications.id}"
    else
      @applications.update(status: "Rejected")
      redirect_to "/admin/applications/#{@applications.id}"
    end
  end
end