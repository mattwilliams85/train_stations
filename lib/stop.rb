class Stop
  attr_accessor :station, :train, :position, :id

  def initialize(station,train,position)
    @station = station
    @train = train
    @position = position
  end

  def self.all
    stops = []
    result = DB.exec('SELECT * FROM stops')
    result.each do |stop|
      station = stop['station_id'].to_i
      train = stop['train_id'].to_i
      position = stop['position'].to_i
      stops << Stop.new(station,train,position)
    end
    stops
  end

  def save
    result = DB.exec("INSERT INTO stops (station_id, train_id, position) VALUES (#{@station}, #{@train},#{@position}) RETURNING ID;")
    @id = result.first['id'].to_i
  end

  def ==(other_stop)
    self.station == other_stop.station && self.train == other_stop.train && self.position == other_stop.position
  end

end
