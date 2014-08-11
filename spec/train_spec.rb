require 'spec_helper'

describe 'station' do
  it 'initializes station with name, location, and id' do
    test_station = Station.new('Killingsworth','24th St')
    expect(test_station).to be_an_instance_of Station
  end

end
