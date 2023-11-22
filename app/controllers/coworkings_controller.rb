class CoworkingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @coworkings = Coworking.all
  end

  def new
    @coworking = Coworking.new
  end

  def create
    @coworking = Coworking.new(coworking_params)
    @coworking.user = current_user
    if @coworking.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def coworking_params
    params.require(:coworking).permit(:title, :address, :price, :image, :description)
  end
end
