def manage_menu
  header
  puts "1 > Add New Station"
  puts "2 > Update Station"
  puts "3 > Add New Line"
  puts "4 > Update Station"
  puts "5 > Return to Main-Menu"
  case gets.chomp
  when "1"
    add_station
    manage_menu
  when "2"
    update_station
    manage_menu
  when "3"
    # add_train
  when "4"
    # update_train
  when "5"
    main_menu
  else
    invalid
    main_menu
  end
end

def add_station
  puts "Enter the name of your new station:"
  s_name = gets.chomp
  new_station = Station.new(s_name,'none',nil)
  new_station.save
  list_trains
  input = nil
  until input == '2'
    puts "Enter the name of the train to tie to station"
    t_name = gets.chomp
    result = Train.fetch_by_name(t_name)
    if result.class == NilClass
      puts "[That is not a valid name, please try again]"
      sleep (1)
    else
      new_stop = Stop.new(new_station.id,result.id,0,0)
      new_stop.save
      puts "Your new stop for #{s_name} has been added!"
      puts "[Press 1 to tie another train or 2 to exit]"
      input = gets.chomp
    end
  end
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

def list_trains
  puts "-----------"
  Train.all.each { |train| puts train.name }
  puts "-----------"
end
