class Spacecraft
  attr_reader :name, :fuel

  def initialize(details)
    @name = details[:name]
    @fuel = details[:fuel]
  end
end
