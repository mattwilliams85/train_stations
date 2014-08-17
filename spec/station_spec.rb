require 'spec_helper'

describe 'station' do
  it 'initializes station with name and location' do
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

  it 'is the same station if it has the same name' do
    station1 = Station.new('Killingsworth','24th St',0)
    station2 = Station.new('Killingsworth','24th St',0)
    expect(station1).to eq station2
  end

  it 'will update a station with a new name' do
    create_test
    save_test
    @station1.update('new_name')
    expect(DB.exec("SELECT * FROM stations WHERE name='new_name'")).to_not be nil
  end

  # it 'will delete a selected station' do
  #   create_test
  #   save_test
  #   @station1.delete
  #   expect(DB.exec("SELECT * FROM stations WHERE name='#{@station1.name}'").first).to be nil
  # end

end
