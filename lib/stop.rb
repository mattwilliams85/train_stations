require 'train'
require 'station'

class Stop
  attr_accessor :station_id, :train_id, :position, :miles_to_next, :id

  def initialize(station_id,train_id,position,miles_to_next)
    @station_id = station_id
    @train_id = train_id
    @position = position
    @miles_to_next = miles_to_next
  end

  def self.all
    stops = []
    result = DB.exec('SELECT * FROM stops')
    result.each do |stop|
      station_id = stop['station_id'].to_i
      train_id = stop['train_id'].to_i
      position = stop['position'].to_i
      miles_to_next = stop['miles_to_next'].to_i
      stops << Stop.new(station_id,train_id,position)
    end
    stops
  end

  def save
    result = DB.exec("INSERT INTO stops (station_id, train_id, position) VALUES (#{@station_id}, #{@train_id},#{@position}) RETURNING ID;")
    @id = result.first['id'].to_i
  end

  def ==(other_stop)
    self.station_id == other_stop.station_id && self.train_id == other_stop.train_id && self.position == other_stop.position
  end

  def self.list_trains(name)
    station_id = Station.fetch_id(name)
    @trains = []
    stops = Stop.all
    stops.each do |stop|
      if stop.station_id == station_id
        @trains << Train.fetch_name(stop.train_id)
      end
    end
    @trains
  end

  def self.list_stops(name)
    station_id = Station.fetch_id(name)
    @stations = []
    stops = Stop.all
    stops.each do |stop|
      if stop.station_id == station_id
        @stations << Station.fetch_name(stop.station_id)
      end
    end
    @stations
  end
end
