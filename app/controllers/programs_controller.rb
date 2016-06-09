class ProgramsController < ApplicationController

  def head_coach_of_program
    @school = School.find_by(name: params[:school_name])
    @program = @school.programs.find_by(sport: params[:program_sport])
    puts '----------------head_coach_of_program------------------'
    puts @school.name
    puts @program.sport

    @head_coach = @program.coach
    # puts @head_coach.length
    puts @head_coach.first_name
    if request.xhr?
      # The bracket around the head coach object is so that I can get a length on the js side. I have no f-ing clue why it loses the array when only one object. If we decide to have more coaches for a program, then we have to get rid of the bracket. Same but reverse with the program list in schools method in school controller. If we return only one program then it will break. This has to get fixed.
      render :json => {:data => [@head_coach]}
    end
  end

  def show
    @program = Program.find_by_id(params[:id])
    if @program
      @school = @program.school
      @coach = @program.coach
      @average_rating = ((@program.average_facility_rating + @school.average_location_rating + @school.average_education_rating + @coach.average_coach_rating)/4).round(1)
    end
  end

end
