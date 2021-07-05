class HousesController < ApplicationController
  before_action :set_house, only: [:show, :update, :destroy]

  # GET /houses
  def index
    @houses = House.all.limit(params[:limit] || 10)

    render json: HouseRepresenter.new(@houses).houses_json, status: :ok
  end

  # GET /houses/1
  def show
    render json: HouseRepresenter.new(@house).as_json, status: :ok
  end

  # POST /houses
  def create
    @house = House.new(house_params)

    if @house.save
      render json: HouseRepresenter.new(@house).as_json , status: :created, location: @house
    else
      render json: { erros: @house.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /houses/1
  def update
    if @house.update(house_params)
      render json: HouseRepresenter.new(@house).as_json, status: :ok
    else
      render json: { errors: @house.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /houses/1
  def destroy
    @house.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def house_params
      params.require(:house).permit(:title, :address, :rent_price, :description, :user_id, :reviews)
    end
end
