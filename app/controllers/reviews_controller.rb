class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_movie
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.movie_id = @movie.id

    respond_to do |format|
      if @review.save
        flash[:success] = "Review was successfully created."
        format.html { redirect_to @movie }
        format.json { render :show, status: :created, location: @review }
      else
        flash[:alert] = 'There was a problem creating the Review.'
        format.html { render 'movies/show' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @review.update(review_params)
      flash[:success] = "Review was successfully updated."
      redirect_to session.delete(:return_to)
    else
      flash[:alert] = 'There was a problem updating the Review.'
      render 'movies/edit'
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      flash[:success] = "Review was successfully destroyed."
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    def review_params
      params.require(:review).permit(:title, :content, :user_id, :movie_id, :rating)
    end
end
