class Station
  attr_accessor :name, :location, :id

  def initialize(name,location)
    @name = name
    @location = location
    @id = 0
  end

  def self.all
  end
end
