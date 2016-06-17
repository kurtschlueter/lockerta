class SchoolsController < ApplicationController

  def program_list_in_school
    @school = School.find_by(name: params[:school_name])
    puts '----------------------'
    puts @school.name
    @programs = @school.programs
    if request.xhr?
      # see head coach of program method in program controller.
      render :json => {:programs => @programs, :school_id => @school.id}
    end
  end
end
