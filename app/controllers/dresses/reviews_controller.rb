class Dresses::ReviewsController < ReviewsController
    before_action :set_reviewable

    private

    def set_reviewable
        @reviewable = Dress.find(params["dress_id"])
    end
end