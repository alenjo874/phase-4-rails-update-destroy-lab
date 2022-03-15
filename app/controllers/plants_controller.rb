class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def update
    edit_plant = Plant.find_by(id: params[:id])
    edit_plant.update(plant_params)
    render json: edit_plant
  end

  def destroy
    delte_plant = Plant.find_by(id: params[:id])
    delte_plant.destroy
  end

  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end
end
