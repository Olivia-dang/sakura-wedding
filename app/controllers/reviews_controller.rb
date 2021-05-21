class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = @reviewable.reviews.new(review_params)
    @review.reviewer = current_user.username
    @review.save
    redirect_to @reviewable, notice: "Your review was successfully posted"
  end

  private

    def review_params
        params.require(:review).permit(:reviewer, :content)
    end
end
