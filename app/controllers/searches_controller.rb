class SearchesController < ApplicationController
  def index
    @search = Search.new(search_params)
    @coworkings = Coworking.where("address LIKE ?", "%#{@search.location}")
  end

  private

  def search_params
    params.require(:search).permit(:location, :check_in, :check_out)
  end
end
