class ResultsController < ApplicationController

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
  
end
