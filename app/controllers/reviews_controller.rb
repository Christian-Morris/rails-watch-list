class ReviewsController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @review = Review.new
  end

  def create
    @list = List.find(params[:list_id])
    @review = Review.new(review_params)
    @review[:list_id] = @list.id
    if @review.save
      redirect_to list_path(params[:list_id]) #need to find out what param this is linking to, the link id...
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :comment, :rating)
  end
end
