class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_movie
  before_action :authenticate_user!

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
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

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    if @review.update(review_params)
      flash[:success] = "Review was successfully updated."
      redirect_to session.delete(:return_to)
    else
      flash[:alert] = 'There was a problem updating the Review.'
      render 'movies/edit'
      #edit_movie_review_path(@movie, @review)
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      flash[:success] = "Review was successfully destroyed."
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :content, :user_id, :movie_id, :rating)
    end
end
