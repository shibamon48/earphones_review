class ReviewsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  def new
    @review = Review.new
  end

  def index
    @q = Review.ransack(params[:q])
    case params[:sort]
      when "latest"
        @reviews = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(6)
      when "old"
        @reviews = @q.result(distinct: true).order(created_at: :asc).page(params[:page]).per(6)
      when "star"
        @reviews = @q.result(distinct: true).order(rating: :desc).page(params[:page]).per(6)
      else
        @reviews = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(6)
      end
  end
  
  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:info] = t('.success')
      redirect_to reviews_path
    else
      flash.now[:error] = t('.failed')
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:info] = t('.success')
      redirect_to review_path(@review)
    else
      flash.now[:error] = t('.failed')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy!
    flash[:info] = t('.success')
    redirect_to reviews_path, status: :see_other
  end
  
  private
  def review_params
    params.require(:review).permit(:name, :maker, :rating, :body, :image).merge(user_id: current_user.id)
  end

end
