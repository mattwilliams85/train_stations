class Station
  attr_accessor :name, :location, :id

  def initialize(name,location)
    @name = name
    @location = location
    @id = 0
  end

  def self.all
    stations = []
    result = DB.exec('SELECT * FROM stations')
    result.each do |station|
      name = station['name']
      location = station['location']
      stations << Station.new(name,location)
    end
    stations
  end

  def save
    result = DB.exec("INSERT INTO stations (name, location) VALUES ('#{@name}', '#{@location}') RETURNING ID;")
    @id = result.first['id'].to_i
  end
end
