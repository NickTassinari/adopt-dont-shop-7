class Admin::ApplicationsController < ApplicationController
  def show
    @applications = Application.find(params[:id])
  end

  def update
    @applications = Application.find(params[:id])
    if params[:approval] == "approved"
      @applications.update(status: "Approved")
      render :show
    else
      @applications.update(status: "Rejected")
      render :show
    end
  end
end