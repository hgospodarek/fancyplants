class EventsController < ApplicationController
  before_action :load_plant

  def create
    @event = @plant.events.build(event_params)
    @event.datetime ||= DateTime.current

    if @event.save
      redirect_to plant_path(@plant), notice: 'Event successfully created'
    else
      redirect_to plant_path(@plant), alert: @event.errors.full_messages.to_sentence
    end
  end

  def edit
    @event = @plant.events.find(params[:id])
  end

  def update
    @event = @plant.events.find(params[:id])

    if @event.update(event_params)
      redirect_to plant_path(@plant), notice: 'Event successfully updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    @event = @plant.events.find(params[:id])

    if @event.destroy
      redirect_to plant_path(@plant), notice: 'Event was successfully destroyed'
    else
      redirect_to plant_path(@plant), notice: 'Something fucked up'
    end
  end

  private

  def load_plant
    @plant = current_user.plants.find(params[:plant_id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :datetime)
  end
end
