def manage_menu
  input = nil
  until input == '7'
    header
    puts "1 > Add New Station"
    puts "2 > Update Station"
    puts "3 > Add Station to Line"
    puts "4 > Remove Station from Line"
    puts "5 > Add New Train"
    puts "6 > Update Train"
    puts "7 > Return to Main-Menu"
    input = gets.chomp
    case input
    when "1"
      add_station
    when "2"
      update_station
    when "3"
      tie_station
    when "4"
      # remove_station
    when "5"
      add_train
    when "6"
      update_train
    when "7"
      main_menu
    else
      invalid
      main_menu
    end
  end
end

def add_station
  puts "Enter the name of your new station:"
  s_name = gets.chomp
  new_station = Station.new(s_name,'none',nil)
  new_station.save
  puts "#{new_station.name} has been added!"
  sleep (1)
end

def update_station
  list_stations
  puts "Enter the name of the station you wish to change:"
  name = gets.chomp
  station = Station.fetch_by_name(name)
  if station.class == NilClass
    puts "[That is not a valid name, please try again]"
    sleep (1)
  else
    puts "Please enter the new station name:"
    new_name = gets.chomp
    station.update(new_name)
    puts "#{name} has now been changed to #{new_name}!"
    sleep (1)
  end
end

def list_stations
  puts "-----------"
  Station.all.each { |station| puts station.name }
  puts "-----------"
end

def add_train
  puts "Enter the name of your new train line:"
  s_name = gets.chomp
  new_train = Train.new(s_name, nil)
  new_train.save
  puts "#{new_train.name} has been added!"
  sleep (1)
end

def tie_station
  puts "Please select the train you wish update:"
  list_trains
  name = gets.chomp
  train = Train.fetch_by_name(name)
  list_stations
  input = nil
  until input == '2'
    puts "Enter the name of the station to tie to the train"
    s_name = gets.chomp
    result = Station.fetch_by_name(s_name)
    if result.class == NilClass
      puts "[That is not a valid name, please try again]"
      sleep (1)
    else
      new_stop = Stop.new(result.id,train.id,0,0)
      new_stop.save
      puts "Your new stop for the #{train.name} line has been added!"
      puts "[Press 1 to tie another train or 2 to exit]"
      input = gets.chomp
    end
  end
end

def update_train
  list_stations
  puts "Enter the name of the station you wish to change:"
  name = gets.chomp
  station = Station.fetch_by_name(name)
  if station.class == NilClass
    puts "[That is not a valid name, please try again]"
    sleep (1)
  else
    puts "Please enter the new station name:"
    new_name = gets.chomp
    station.update(new_name)
    puts "#{name} has now been changed to #{new_name}!"
    sleep (1)
  end
end

def list_trains
  puts "-----------"
  Train.all.each { |train| puts train.name }
  puts "-----------"
end
