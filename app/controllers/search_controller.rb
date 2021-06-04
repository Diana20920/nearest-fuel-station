class SearchController < ApplicationController
  def index
    start_location = params[:location]
    conn1 = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['NREL']}&location=#{start_location}&fuel_type=ELEC&limit=1")
    response = JSON.parse(conn1.body, symbolize_names: true)
    @electric_station = Station.new(response[:fuel_stations].first)


    conn2 = Faraday.get("http://www.mapquestapi.com/directions/v2/route?key=#{ENV['MAPQUEST']}&from=#{start_location}&to=#{@electric_station.address}")
    response2 = JSON.parse(conn2.body, symbolize_names: true)
    # this contains a session ID
    @directions = StationDirections.new(response2[:route])



  end
end
