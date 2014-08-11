require 'pry'
require 'rspec'
require 'station'
require 'train'
require 'stop'
require 'pg'

DB = PG.connect(:dbname => 'max_database_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stations *;")
    DB.exec("DELETE FROM trains *;")
    DB.exec("DELETE FROM stops *;")
  end
end

def create_test
  @station1 = Station.new('Killingsworth','24th St')
  @train1 = Train.new('Red')
  @stop1 = Stop.new(1,2,3)
end

def save_test
  @station1.save
  @train1.save
  @stop1.save
end
