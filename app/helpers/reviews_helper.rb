module ReviewsHelper

  def has_reviews?(record)
    record.reviews.length > 0
  end

  def coach_has_no_reviews(program, coach)
    program.reviews.where(coach_id: coach.id).length == 0
  end

end
