class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /movies
  # GET /movies.json
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

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        flash[:success] = "Movie was successfully created."
        format.html { redirect_to @movie }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        flash[:success] = "Movie was successfully updated."
        format.html { redirect_to @movie }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:name, :year, :trailer, :genre, :country, :director_id)
    end
end
