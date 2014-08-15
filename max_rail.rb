require 'pry'
require 'pg'

require './lib/stop'
require './lib/train'
require './lib/station'

DB = PG.connect(:dbname => 'max_database')

def header
  system 'clear'
  puts "[=== MAX-RAIL SYSTEM ===]"
  puts "\n"
end

def invalid
  puts "Sorry that isn't a valid entry"
  puts "Hit [enter] to continue"
  gets
end

def main_menu
  header
  puts "1 > Manage Train Stations"
  puts "2 > Information"
  puts "3 > Exit"
  case gets.chomp
  when "1"
    #manage_menu
  when "2"
    info_menu
  when "3"
    puts "Goodbye!"
    puts "\n"
  else
    invalid
    main_menu
  end
end

def info_menu
  puts "1 > Train Information"
  puts "2 > Station Information"
  puts "3 > Return to Main Menu"
  case gets.chomp
  when "1"
    train_info
  when "2"
    # station_info
  when "3"
    puts "Goodbye!"
    puts "\n"
  else
    invalid
    info_menu
  end
end

def train_info
  puts ""
end

def list_by_class(klass)

end
main_menu
