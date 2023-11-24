class CoworkingsController < ApplicationController
  before_action :find_coworking, only: %i[edit update show]

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
      redirect_to coworking_path(@coworking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # before action
    @markers = [{
        lat: @coworking.latitude,
        lng: @coworking.longitude
    }]
  end

  def edit
  end

  def update
    if @coworking.update(coworking_params)
      redirect_to root_path, notice: 'The coworking was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @coworking = Coworking.find(params[:id])
    @coworking.destroy
    redirect_to profile_path, notice: 'The coworking was successfully deleted'
  end

  private

  def find_coworking
    @coworking = Coworking.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Coworking not found.'
    redirect_to root_path
  end

  def coworking_params
    params.require(:coworking).permit(:title, :address, :price, :image, :description)
  end
end
