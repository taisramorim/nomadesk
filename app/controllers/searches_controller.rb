class SearchesController < ApplicationController
  def index
    @coworkings = Coworking.search_by_location(params[:query])
  end
end
