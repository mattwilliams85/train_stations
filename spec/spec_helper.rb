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
