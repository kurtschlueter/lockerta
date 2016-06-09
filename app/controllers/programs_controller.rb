class ProgramsController < ApplicationController

  def show
    @program = Program.find_by_id(params[:id])
    puts @program
  end

end
