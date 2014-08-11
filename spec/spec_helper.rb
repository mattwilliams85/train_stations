require 'pry'
require 'rspec'
require 'station'
require 'pg'

DB = PG.connect(:dbname => 'max_database_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stations *;")
  end
end

def create_test
   @station1 = Station.new('Killingsworth','24th St')
end

def save_test
  @station1.save
end
