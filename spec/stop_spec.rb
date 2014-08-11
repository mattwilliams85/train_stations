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
    expect(@stop1.station).to eq (1)
  end

   it 'is the same stop if it has the same name' do
    stop1 = Stop.new(1,2,3)
    stop2 = Stop.new(1,2,3)
    expect(stop1).to eq stop2
  end

end
