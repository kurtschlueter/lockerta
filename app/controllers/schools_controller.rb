class SchoolsController < ApplicationController

  def search
    # puts '----------entered schools/search route----------'
    # puts params[:input]

    @schools = School.search(params[:input])
    if request.xhr?
      render :json => {:data => @schools}
    end
  end

  def program_list_in_school
    @school = School.find_by(name: params[:school_name])
    puts '----------------------'
    puts @school.name
    @programs = @school.programs
    if request.xhr?
      render :json => {:data => @programs}
    end
  end
end
