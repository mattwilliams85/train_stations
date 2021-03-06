class Train
  attr_accessor :name, :id

  def initialize(name,id)
    @name = name
    @id = id
  end

  def self.all
    trains = []
    result = DB.exec("SELECT * FROM trains")
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

  def self.fetch_by_name(name)
    @result = nil
    Train.all.each do |train|
      if train.name == name
        @result = train
      end
    end
    @result
  end

  def self.fetch_by_id(id)
    Train.all.each do |train|
      if train.id == id
        @result = train
      end
    end
    @result
  end

  def delete
    DB.exec("DELETE FROM trains WHERE name='#{self.name}'")
  end

  def update(new_name)
    DB.exec("UPDATE trains SET name='#{new_name}' WHERE name='#{self.name}'")
    @name = new_name
  end

end
