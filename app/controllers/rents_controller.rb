class RentsController < ApplicationController
  before_action :set_coworking, only: [:new, :create]
  before_action :set_rent, only: %i[edit show update destroy accept reject]

  def edit
  end

  def update
    if @rent.update(rent_params)
      redirect_to profile_path, notice: "Your stay has been updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

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

  def show
    # before_action
    @coworking = @rent.coworking
  end

  def destroy
    @rent.destroy
    redirect_to profile_path
  end

  def accept
    @rent.update(status: :accepted)
    respond_to do |format|
      format.js { render inline: "location.reload();" }
    end
  end

  def reject
    @rent.update(status: :rejected)
    respond_to do |format|
      format.js { render inline: "location.reload();" }
    end
  end

  private

  def set_coworking
    @coworking = Coworking.find(params[:coworking_id])
  end

  def rent_params
    params.require(:rent).permit(:start_date, :end_date, :coworking_id, :user_id)
  end

  def set_rent
    @rent = Rent.find(params[:id])
  end
end
