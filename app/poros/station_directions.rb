class StationDirections
  attr_reader :distance,
              :travel_time,
              :narrated

  def initialize(data)
    @distance = data[:distance]
    @travel_time = data[:formattedTime]
    @narrated = narrated_directions(data)
  end

  def narrated_directions(data)
    data[:legs].first[:maneuvers].map do |maneuver|
      maneuver[:narrative]
    end
  end
end
