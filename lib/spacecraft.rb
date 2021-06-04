class Spacecraft
  attr_reader :name, :fuel, :requirements

  def initialize(details)
    @name = details[:name]
    @fuel = details[:fuel]
    @requirements = []
  end

  def add_requirement(req)
    @requirements.push(req)
  end
end
