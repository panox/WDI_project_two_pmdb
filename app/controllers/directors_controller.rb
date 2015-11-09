class DirectorsController < ApplicationController
  before_action :set_director, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @directors = Director.all
  end

  def show
  end

  def new
    @director = Director.new
  end

  def edit
  end

  def create
    @director = Director.new(director_params)

    respond_to do |format|
      if @director.save
        flash[:success] = "Director was successfully created."
        format.html { redirect_to @director}
        format.json { render :show, status: :created, location: @director }
      else
        flash[:alert] = 'There was a problem creating the Director.'
        format.html { render :new }
        format.json { render json: @director.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @director.update(director_params)
        flash[:success] = "Director was successfully updated."
        format.html { redirect_to @director }
        format.json { render :show, status: :ok, location: @director }
      else
        flash[:alert] = 'There was a problem updating the Director.'
        format.html { render :edit }
        format.json { render json: @director.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user.try(:admin?)
      @director.destroy
      respond_to do |format|
        flash[:success] = "Director was successfully destroyed."
        format.html { redirect_to directors_url }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_director
      @director = Director.find(params[:id])
    end

    def director_params
      params.require(:director).permit(:name, :description, :country, :picture)
    end
end
