class RentsController < ApplicationController
  before_action :find_coworking, only: [:edit, :update]

  def edit
  end

  def update
    if @rent.update(rent_params)
      redirect_to root_path, notice: "Your stay has been updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def find_coworking
    @rent = Rent.find(params[:id])
  end

  def rent_params
    params.require(:coworking.permit(:start_date, :end_date))
  end
end
end
