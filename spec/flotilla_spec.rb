require './lib/spacecraft'
require './lib/person'
require './lib/flotilla'

RSpec.describe 'Flotilla' do
  before do
    @daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    @seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})
  end
  it "can be instantiated" do
    expect(@seventh_flotilla).to be_instance_of(Flotilla)
  end
  it "has attributes" do
    expect(@seventh_flotilla.name).to eq('Seventh Flotilla')
    expect(@seventh_flotilla.personnel).to eq([])
    expect(@seventh_flotilla.ships).to eq([])
  end
  it "can add ships" do
    @seventh_flotilla.add_ship(@daedalus)
    expect(@seventh_flotilla.ships).to eq([@daedalus])
  end
  it "can add personnel" do
    kathy = Person.new('Kathy Chan', 10)
    kathy.add_specialty(:astrophysics)
    kathy.add_specialty(:quantum_mechanics)
    polly = Person.new('Polly Parker', 8)
    polly.add_specialty(:operations)
    polly.add_specialty(:maintenance)
    rover = Person.new('Rover Henriette', 1)
    rover.add_specialty(:operations)
    rover.add_specialty(:maintenance)
    sampson = Person.new('Sampson Edwards', 7)
    sampson.add_specialty(:astrophysics)
    sampson.add_specialty(:quantum_mechanics)
    @seventh_flotilla.add_personnel(kathy)
    @seventh_flotilla.add_personnel(polly)
    @seventh_flotilla.add_personnel(rover)
    @seventh_flotilla.add_personnel(sampson)
    expect(@seventh_flotilla.personnel).to eq([kathy, polly, rover, sampson])
  end
  it "can recommend_personnel" do
    kathy = Person.new('Kathy Chan', 10)
    kathy.add_specialty(:astrophysics)
    kathy.add_specialty(:quantum_mechanics)

    polly = Person.new('Polly Parker', 8)
    polly.add_specialty(:operations)
    polly.add_specialty(:maintenance)

    rover = Person.new('Rover Henriette', 1)
    rover.add_specialty(:operations)
    rover.add_specialty(:maintenance)

    sampson = Person.new('Sampson Edwards', 7)
    sampson.add_specialty(:astrophysics)
    sampson.add_specialty(:quantum_mechanics)

    @seventh_flotilla.add_personnel(kathy)
    @seventh_flotilla.add_personnel(polly)
    @seventh_flotilla.add_personnel(rover)
    @seventh_flotilla.add_personnel(sampson)

    all_persons = [kathy, polly, rover, sampson]
    expect(@seventh_flotilla.recommend_personnel(@daedalus)).to eq(all_persons)

    odyssey = Spacecraft.new({name: 'Odyssey', fuel: 300})
    odyssey.add_requirement({operations: 6})
    odyssey.add_requirement({maintenance: 3})


    expected = [polly]
    expect(@seventh_flotilla.recommend_personnel(odyssey)).to eq(expected)
  end
end
