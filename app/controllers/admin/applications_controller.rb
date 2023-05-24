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
      render :show
    else
      @applications.update(status: "Rejected")
      render :show
    end
  end
end