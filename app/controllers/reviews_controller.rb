class ReviewsController < ApplicationController

  def index

  end

  def show

  end

  def new
    if current_user
      @user = current_user
      @review = Review.new
      @schools = School.all
    else
      redirect_to "/login"
      flash[:error] = "Please log in to submit review"
    end
  end

  def create

    empty_fields = []

    params[:review_data].each do |key, value|
      if value == ''
        empty_fields << key
      end
    end

    if empty_fields.length == 0
      @user = current_user

      @coach = Coach.find(params[:review_data][:coach_id].to_i)
      @school = School.find(params[:review_data][:school_id].to_i)
      @program = Program.find(params[:review_data][:program_id].to_i)


      @review = Review.new(user: @user, coach: @coach, school: @school, program: @program,
              hc_player_relationships: params[:review_data][:hc_player_relationships].to_i,
              hc_player_development: params[:review_data][:hc_player_development].to_i,
              hc_recruiting: params[:review_data][:hc_recruiting].to_i,
              hc_pro_connections: params[:review_data][:hc_pro_connections].to_i,
              hc_sport_knowledge: params[:review_data][:hc_sport_knowledge].to_i,
              hc_would_play_with_again: true,
              hc_comments: params[:review_data][:hc_comments],
              f_main_arena: params[:review_data][:f_main_arena].to_i,
              f_home_atmosphere: params[:review_data][:f_home_atmosphere].to_i,
              f_weight_room: params[:review_data][:f_weight_room].to_i,
              f_locker_room: params[:review_data][:f_locker_room].to_i,
              f_training_facility: params[:review_data][:f_training_facility].to_i,
              f_comments: params[:review_data][:f_comments],
              l_program_tradition: params[:review_data][:l_program_tradition].to_i,
              l_community_interest: params[:review_data][:l_community_interest].to_i,
              l_weather: params[:review_data][:l_weather].to_i,
              l_nightlife: params[:review_data][:l_nightlife].to_i,
              l_comments: params[:review_data][:l_comments],
              e_school_difficulty: params[:review_data][:e_school_difficulty].to_i,
              e_academic_support: params[:review_data][:e_academic_support].to_i,
              e_school_reputation: params[:review_data][:e_school_reputation].to_i,
              e_graduated: true,
              e_comments: params[:review_data][:e_comments],
              conference_rival: params[:review_data][:conference_rival],
              toughest_conference_place_to_play: params[:review_data][:toughest_conference_place_to_play])

      if @review.save
          render :json => {:empty_fields => ['saved']}
      end
    else
      output = ReviewsHelper.dom_ids_to_string_empty_fields(empty_fields)
      render :json => {:empty_fields => output}
    end
  end

  def destroy
    # article = Article.find(params[:id])
    # flash.notice = "Article '#{article.title}' deleted!"
    # article.destroy

    # redirect_to action: "index"
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    redirect_to '/'
    # @article = Article.find(params[:id])
    # @article.update(article_params)

    # flash.notice = "Article '#{@article.title}' Updated!"

    # redirect_to article_path(@article)
  end

end
