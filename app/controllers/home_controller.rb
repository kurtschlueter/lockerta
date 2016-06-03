class HomeController < ApplicationController

  def index
    @coaches = Coach.top_five_coaches
    @facilities = Program.top_five_facilities
    @locations = School.top_five_locations
    @educations = School.top_five_educations
  end
end
