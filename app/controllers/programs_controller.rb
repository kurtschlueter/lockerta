class ProgramsController < ApplicationController

  def show
    @program = Program.find_by_id(params[:id])
    if @program
      @school = @program.school
      @coach = @program.coach
      @average_rating = ((@program.average_facility_rating + @school.average_location_rating + @school.average_education_rating + @coach.average_coach_rating)/4).round(1)
    end
  end

end
