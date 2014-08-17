def info_menu
  input = nil
  until input == '3'
    header
    puts "1 > Train Information"
    puts "2 > Station Information"
    puts "3 > Return to Main Menu"
    input = gets.chomp
    case input
    when "1"
      train_info
      continue
    when "2"
      station_info
      continue
    when "3"
      main_menu
    else
      invalid
    end
  end
end

def train_info
  puts "\n"
  Train.all.each do |train|
    puts "Line - #{train.name}"
    puts "-------------"
    Stop.all.each do |stop|
      if train.id == stop.train_id
        puts "Stop - #{Station.fetch_by_id(stop.station_id).name}"
      end
    end
    puts "\n"
  end
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
end
