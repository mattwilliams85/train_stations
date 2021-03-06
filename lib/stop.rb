require './lib/train'
require './lib/station'

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
      stops << Stop.new(station_id,train_id,position,miles_to_next)
    end
    stops
  end

  def save
    result = DB.exec("INSERT INTO stops (station_id, train_id, position) VALUES (#{@station_id}, #{@train_id}, #{@position}) RETURNING ID;")
    @id = result.first['id'].to_i
  end

  def ==(other_stop)
    self.station_id == other_stop.station_id && self.train_id == other_stop.train_id && self.position == other_stop.position
  end

  def self.list_trains(name)
    station_id = Station.fetch_by_name(name).id
    @trains = []
    stops = Stop.all
    stops.each do |stop|
      if stop.station_id == station_id
        @trains << Train.fetch_by_id(stop.train_id)
      end
    end
    @trains
  end

  def self.list_stops(name)
    train_id = Train.fetch_by_name(name).id
    @stations = []
    stops = Stop.all
    stops.each do |stop|
      if stop.train_id == train_id
        @stations << Station.fetch_by_id(stop.train_id)
      end
    end
    @stations
  end

  def self.delete(train_id,station_id)
    DB.exec("DELETE FROM stops WHERE train_id=#{train_id} AND station_id=#{station_id}")
  end

end
