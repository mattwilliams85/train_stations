require 'train_menu'

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
  when "2"
    # update_station
  when "3"
    # add_train
  when "4"
    # update_train
  when "5"
    # main_menu
  else
    invalid
    main_menu
  end
end

