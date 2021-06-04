class Flotilla
  attr_reader :name, :personnel, :ships

  def initialize(details)
    @name = details[:designation]
    @personnel = []
    @ships = []
  end

  def add_ship(ship)
    @ships.push(ship)
  end

  def add_personnel(person)
    @personnel.push(person)
  end

  def recommend_personnel(ship)
    personnel.find_all do |person|
      next if person.specialties.empty?

      ship.requirements.any? do |req|
        area, exp = req.first
        person.experience >= exp && person.specialties.include?(area)
      end
    end
  end
end
