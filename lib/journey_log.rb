require_relative = "journey"
class JourneyLog

  attr_reader :journey_class

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    @journeys << journey_class.new(entry_station)
  end

  def finish(exit_station)
    @journeys << exit_station
  end

private

  def current_journey
    journey_class.new unless !@journey.empty?
    @journey.keys[0]
  end

end
