class Train
  attr_accessor :name, :id

  def initialize(name,id)
    @name = name
    @id = id
  end

  def self.all
    trains = []
    result = DB.exec('SELECT * FROM trains')
    result.each do |train|
      name = train['name']
      id = train['id'].to_i
      trains << Train.new(name,id)
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

  def self.fetch_id(name)
    Train.all.each do |train|
      if train.name == name
        @result = train.id
      end
    end
    @result
  end

  def self.fetch_name(id)
    Train.all.each do |train|
      if train.id == id
        @result = train.name
      end
    end
    @result
  end

end
