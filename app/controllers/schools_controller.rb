class SchoolsController < ApplicationController

  def search
    # puts '----------entered schools/search route----------'
    # puts params[:input]

    @schools = School.search(params[:input])
    if request.xhr?
      render :json => {:data => @schools}
    end
  end
end
