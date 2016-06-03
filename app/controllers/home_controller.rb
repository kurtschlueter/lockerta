class HomeController < ApplicationController

  def index
    @coaches = Coach.top_five_coaches
    @facilities = Program.top_five_facilities
  end
end
