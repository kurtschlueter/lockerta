module ReviewsHelper

  def has_reviews?(record)
    record.reviews.length > 0
  end
end
