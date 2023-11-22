class RentsController < ApplicationController
  before_action :set_coworking, only: [:new, :create]

  def index
    @rents = Rent.all
  end

  def new
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(rent_params)
    @rent.coworking = @coworking
    @rent.user = current_user
    if @rent.save
      redirect_to root_path, notice: 'Rent was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_coworking
    @coworking = Coworking.find(params[:coworking_id])
  end

  def rent_params
    params.require(:rent).permit(:start_date, :end_date, :coworking_id, :user_id)
  end
end
