class ProgramsController < ApplicationController

  def head_coach_of_program
    @school = School.find(params[:school_id])
    @program = @school.programs.find_by(sport: params[:program_sport])
    puts '----------------head_coach_of_program------------------'
    puts @school.name
    puts @program.sport

    @head_coach = @program.coach
    # puts @head_coach.length
    puts @head_coach.first_name
    if request.xhr?
      render :json => {:program_id => @program.id, :coach => @head_coach}
    end
  end

  def show
    @program = Program.find_by_id(params[:id])
    if @program
      @school = @program.school
      @coach = @program.coach
      if @program.reviews.length > 0 && @program.reviews.where(coach_id: @coach.id).length > 0
       @average_rating = ((@program.average_facility_rating + @school.average_location_rating + @school.average_education_rating + @coach.average_coach_rating)/4).round(1)
      else
        @average_rating = 'Not Rated'
      end
    end
  end

end
