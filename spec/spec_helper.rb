require 'pry'
require 'rspec'
require 'station'
require 'train'
require 'stop'
require 'pg'

DB = PG.connect(:dbname => 'max_database_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('TRUNCATE TABLE trains RESTART IDENTITY;')
    DB.exec('TRUNCATE TABLE stations RESTART IDENTITY;')
    DB.exec('TRUNCATE TABLE stops RESTART IDENTITY;')
  end
end

def create_test
  @station1 = Station.new('Killingsworth','24th St',0)
  @station2 = Station.new('Vancouver','10th St',0)
  @station3 = Station.new('Oregon City','Electric Ave',0)
  @station4 = Station.new('Fake City','Fake Pl',0)
  @train1 = Train.new('Red',0)
  @train2 = Train.new('Blue',0)
  @train3 = Train.new('Green',0)
  @train4 = Train.new('Yellow',0)
  @stop1 = Stop.new(1,1,1)
  @stop2 = Stop.new(2,1,2)
  @stop3 = Stop.new(3,2,3)
  @stop4 = Stop.new(3,3,3)
end

def save_test
  @station1.save
  @station2.save
  @station3.save
  @station4.save
  @train1.save
  @train2.save
  @train3.save
  @train4.save
  @stop1.save
  @stop2.save
  @stop3.save
  @stop4.save
end
