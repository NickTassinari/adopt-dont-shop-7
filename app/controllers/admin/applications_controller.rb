class Admin::ApplicationsController < ApplicationController
  def show
    @applications = Application.find(params[:id])
    @pets = @applications.pets
  end
end