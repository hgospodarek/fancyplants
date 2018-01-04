class PlantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @plants = current_user.plants
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user

    if @plant.save
      redirect_to plants_path, notice: "#{@plant.name} successfully added"
    else
      render :new, errors: @plant.errors.full_messages.to_sentence
    end
  end

  def show
    @plant = current_user.plants.find(params[:id])

    @event = @plant.events.build
    @events = @plant.events.order(created_at: :desc)
  end

  def edit
    @plant = current_user.plants.find(params[:id])
  end

  def update
    @plant = current_user.plants.find(params[:id])

    if @plant.update(plant_params)
      redirect_to plant_path(@plant), notice: "#{@plant.name} successfully updated"
    else
      render :edit, errors: @plant.errors.full_messages.to_sentence
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :scientific_name, :alternate_names, :description, :plant_type, :pot_type, :pot_size, :location, :soil, :fertilizer, :light_requirement, :fertilizer_requirement, :humidity_requirement, :water_requirement, :soil_requirement, :pruning_requirement, :temperature_range, :zone, :origin, :dormancy_cycle, :bloom_cycle, :propagation_method)
  end
end
