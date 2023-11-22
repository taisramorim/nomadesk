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
    if @coworking.save
      redirect_to @coworking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @coworking = Coworking.find(params[:id])
  end

  private

  def coworking_params
    params.require(:coworking).permit(:title, :address, :price, :image, :description)
  end
end
