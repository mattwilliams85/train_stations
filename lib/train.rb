class Train
  attr_accessor :name, :id

  def initialize(name)
    @name = name
  end

  def self.all
    trains = []
    result = DB.exec('SELECT * FROM trains')
    result.each do |train|
      name = train['name']
      trains << Train.new(name)
    end
    trains
  end

  def save
    result = DB.exec("INSERT INTO trains (name) VALUES ('#{@name}') RETURNING ID;")
    @id = result.first['id'].to_i
  end

  def ==(other_train)
    self.name == other_train.name
  end

end
