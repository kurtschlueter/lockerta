class SchoolsController < ApplicationController

  def search
    puts '----------entered schools/search route----------'
    # respond_to do |format|
    #   format.html
    #   format.json { @schools = School.search(params[:term]) }
    # end

    # @schools = School.search(params[:term])

    # @schools.each do |school|
    #   puts school.name
    # end
puts params[:input]
     @schools = School.search(params[:input])
    if request.xhr?
        render :json => {
                            :data => @schools
                        }
     end

  end
end
