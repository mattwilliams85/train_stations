require 'spec_helper'

describe 'train' do
  it 'initializes train with name' do
    create_test
    expect(@train1).to be_an_instance_of Train
  end

  it 'starts with no stations saved in the system' do
    expect(Train.all).to eq []
  end

  it 'saves the train class into the database and returns ID' do
    create_test
    save_test
    expect(@train1.id).to be_an_instance_of(Fixnum)
  end

  it 'pulls the correct data from the server into the class' do
    create_test
    save_test
    Train.all
    expect(@train1.name).to eq ('Red')
  end

  it 'is the same train if it has the same name' do
    train1 = Train.new('Orange',0)
    train2 = Train.new('Orange',0)
    expect(train1).to eq train2
  end

  it 'will update a train with a new name' do
    create_test
    save_test
    @train1.update('new_name')
    expect(DB.exec("SELECT * FROM trains WHERE name='new_name'").first).to_not be nil
  end

  it 'will delete a selected train' do
    create_test
    save_test
    @train1.delete
    expect(DB.exec("SELECT * FROM trains WHERE name='#{@train1.name}'").first).to be nil
  end

end
