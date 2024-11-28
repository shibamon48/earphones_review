class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def index
    @user = current_user
    @reviews = Review.all
  end
  
  def show
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:info] = "レビューを投稿しました"
      redirect_to reviews_path
    else
      flash.now[:error] = "レビューの投稿に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end
  
  private
  def review_params
    params.require(:review).permit(:name, :maker, :body).merge(user_id: current_user.id)
  end

end
