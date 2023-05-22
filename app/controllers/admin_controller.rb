class AdminController < ApplicationController
  def index
    @shelters = Shelter.sort_name_desc
  end
end