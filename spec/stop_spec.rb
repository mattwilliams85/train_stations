require 'spec_helper'

describe 'stop' do
  it 'initializes stop with name' do
    create_test
    expect(@stop1).to be_an_instance_of Stop
  end

  it 'starts with no stops saved in the system' do
    expect(Stop.all).to eq []
  end

  it 'saves the stop class into the database and returns ID' do
    create_test
    save_test
    expect(@stop1.id).to be_an_instance_of(Fixnum)
  end

  it 'pulls the correct data from the server into the class' do
    create_test
    save_test
    Stop.all
    expect(@stop1.station_id).to eq (1)
  end

  it 'is the same stop if it has the same name' do
    stop1 = Stop.new(1,2,3,10)
    stop2 = Stop.new(1,2,3,10)
    expect(stop1).to eq stop2
  end

  it 'lists the correct number of trains for a single stop' do
    create_test
    save_test
    expect(Stop.list_trains('Oregon City').length).to eq 2
  end

  it 'lists the correct number of stops for a single station' do
    create_test
    save_test
    expect(Stop.list_stops('Red').length).to eq 2
  end

  it 'deletes a stop when given train id and station id' do
    create_test
    save_test
    Stop.delete(@train1.id,@station1.id)
    expect(DB.exec("SELECT * FROM stops WHERE train_id=#{@train1.id} AND station_id=#{@station1.id}").first).to eq nil
  end

end
