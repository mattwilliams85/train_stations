require 'train_menu'

def info_menu
  header
  puts "1 > Train Information"
  puts "2 > Station Information"
  puts "3 > Return to Main Menu"
  case gets.chomp
  when "1"
    train_info
  when "2"
    station_info
  when "3"
    main_menu
  else
    invalid
    info_menu
  end
end

def train_info
  puts "\n"
  Train.all.each do |train|
    puts "Line - #{train.name.upcase}"
    puts "-------------"
    Stop.all.each do |stop|
      if train.id == stop.train_id
        puts "Stop - #{Station.fetch_by_id(stop.station_id).name}"
      end
    end
    puts "\n"
  end
  continue
  info_menu
end

def station_info
  puts "\n"
  Station.all.each do |station|
    puts "Station - #{station.name.upcase}"
    puts "-------------"
    Stop.all.each do |stop|
      if station.id == stop.station_id
        puts "Line - #{Train.fetch_by_id(stop.train_id).name}"
      end
    end
    puts "\n"
  end
  continue
  info_menu
end
