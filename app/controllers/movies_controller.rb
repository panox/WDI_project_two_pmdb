class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:q] == nil
      @movies = Movie.all.sort { |a,b| b.rating <=> a.rating}
    elsif params[:q] != ""
      if Movie.search_by_title(params[:q]) != []
        @movies = Movie.search_by_title(params[:q]).sort { |a,b| b.rating <=> a.rating}
      else
        @movies = Movie.all.sort { |a,b| b.rating <=> a.rating}
      end
    else 
      @movies = Movie.all.sort { |a,b| b.rating <=> a.rating}
    end
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        flash[:success] = "Movie was successfully created."
        format.html { redirect_to @movie }
        format.json { render :show, status: :created, location: @movie }
      else
        flash[:alert] = 'There was a problem creating the Movie.'
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        flash[:success] = "Movie was successfully updated."
        format.html { redirect_to @movie }
        format.json { render :show, status: :ok, location: @movie }
      else
        flash[:alert] = 'There was a problem updating the Movie.'
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user.try(:admin?)
      @movie.destroy
      respond_to do |format|
        flash[:success] = "Movie was successfully destroyed."
        format.html { redirect_to movies_url }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:name, :year, :trailer, :genre, :country, :director_id)
    end
end
