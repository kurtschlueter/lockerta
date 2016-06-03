class HomeController < ApplicationController

  def index
    @coaches = Coach.top_five_coaches
  end
end
