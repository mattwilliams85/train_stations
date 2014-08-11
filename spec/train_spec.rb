require 'spec_helper'

describe 'station' do
  it 'initializes station with name, location, and id' do
    create_test
    expect(@station1).to be_an_instance_of Station
  end

  it 'starts with no stations saved in the system' do
    expect(Station.all).to eq []
  end

  it 'saves the station class into the database and returns ID' do
    create_test
    save_test
    expect(@station1.id).to be_an_instance_of(Fixnum)
  end

  it 'pulls the correct data from the server into the class' do
    create_test
    save_test
    Station.all
    expect(@station1.name).to eq ('Killingsworth')
    expect(@station1.location).to eq ('24th St')
  end

end
