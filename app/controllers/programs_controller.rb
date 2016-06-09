class ProgramsController < ApplicationController

  def show
    @program = Program.find_by_id(params[:id])
    if @program
      @school = @program.school
      @coach = @program.coach
    end
  end

end
