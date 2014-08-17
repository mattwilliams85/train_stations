require 'pry'
require 'pg'

require './lib/stop'
require './lib/train'
require './lib/station'
require './info_menu'
require './manage_menu'

DB = PG.connect(:dbname => 'max_database')

def header
  system 'clear'
  puts "[======================= MAX-RAIL SYSTEM =======================]"
  puts "
        __----_ _-----------------------------`--`___----__
    .-'_________#################################_________`-.
   //[_]| |                              /  |         | |[_] |
  /     | |                             <---+--->     | |    |
 |                                                           |_
 (      |_|            MAX RAIL              |  /     |_|      )
[============================================================/=]
   )__-(-o-)=___=(-o-)-___________/______-(-o-)=___=(-o-)-__(
=================================================================
"
  puts "\n"
end

def invalid
  puts "Sorry that isn't a valid entry"
  puts "Hit [enter] to continue"
  gets
end

def continue
  puts "\n"
  puts "Press [ENTER] to continue..."
  gets.chomp
end

def main_menu
  header
  puts "1 > Manage Train Stations"
  puts "2 > Information"
  puts "3 > Exit"
  case gets.chomp
  when "1"
    manage_menu
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




main_menu
