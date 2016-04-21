require_relative = "journey"
class JourneyLog

  attr_reader :journey_class

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    @entry_station = entry_station
    @journeys << {journey_class.new(@entry_station)}
  end

  def finish(exit_station)
    @journeys << { @entry_station => exit_station }

  end

  def journeys
    @journeys.dup
  end

private

  def current_journey
    journey_class.new unless !@journey.empty?
    @journey.keys[0]
  end

end
