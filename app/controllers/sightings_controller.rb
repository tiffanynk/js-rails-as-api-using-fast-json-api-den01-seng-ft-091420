class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
    render json: SightingSerializer.new(sightings)
  end

  #ncluded relationships connecting the SightingSerializer to :bird and :location, to 
  #include attributes from those objects, the recommended method is to pass in a second 
  #options parameter to the serializer indicating that we want to include those objects:
  def show
    sighting = Sighting.find_by(id: params[:id])
    options = {
      include: [:bird, :location]
    }
    render json: SightingSerializer.new(sighting, options)
  end
end
