class Admin::ApplicationsController < ApplicationController
  def show 
    @applications = Application.find(params[:id])
  end

  def update 
    @applications = Application.find(params[:id])
    @applications.update(status: "Approved")
    @applications.save
    redirect_to "/admin/applications/#{@applications.id}"
    flash[:success] = "Application Approved"
  end
end