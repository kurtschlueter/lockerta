class ProgramsController < ApplicationController

  def head_coach_of_program
    @school = School.find_by(name: params[:school_name])
    @program = @school.programs.find_by(sport: params[:program_sport])
    puts '----------------------------------'
    puts @school.name
    puts @program.sport

    @head_coach = @program.coach
    # puts @head_coach.length
    puts @head_coach.first_name
    if request.xhr?
      render :json => {:data => [@head_coach]}
    end
  end

end
