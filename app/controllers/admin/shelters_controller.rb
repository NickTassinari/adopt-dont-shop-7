class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.sort_name_desc
    @shelts = Shelter.pending_applications
  end
end