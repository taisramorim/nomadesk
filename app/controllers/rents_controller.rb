class RentsController < ApplicationController
  before_action :set_rent, only: %i[show destroy accept reject]
  def show
    # before_action
    @coworking = @rent.coworking
  end

  def destroy
    @rent.destroy
    redirect_to coworking_path(@rent.coworking)
  end

  def accept
    @rent.update(status: :accepted)
    redirect_to coworking_path(@rent.coworking)
  end

  def reject
    @rent.update(status: :rejected)
    redirect_to coworking_path(@rent.coworking)
  end

  private

  def set_rent
    @rent = Rent.find(params[:id])
  end
end
