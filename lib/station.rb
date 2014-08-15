class Station
  attr_accessor :name, :location, :id

  def initialize(name,location,id)
    @name = name
    @location = location
    @id = id
  end

  def self.all
    stations = []
    result = DB.exec('SELECT * FROM stations')
    result.each do |station|
      name = station['name']
      location = station['location']
      id = station['id'].to_i
      stations << Station.new(name,location,id)
    end
    stations
  end

  def save
    result = DB.exec("INSERT INTO stations (name, location) VALUES ('#{@name}', '#{@location}') RETURNING ID;")
    @id = result.first['id'].to_i
  end

  def ==(other_station)
    self.name == other_station.name && self.location == other_station.location
  end

  def self.fetch_by_name(name)
    Station.all.each do |station|
      if station.name == name
        @result = station
      end
    end
    @result
  end

  def self.fetch_by_id(id)
    Station.all.each do |station|
      if station.id == id
        @result = station
      end
    end
    @result
  end

end
