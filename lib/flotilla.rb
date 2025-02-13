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

  def personnel_by_ship
    result = {}
    ships.each do |ship|
      result[ship] = recommend_personnel(ship)
    end
    result
  end

  def ready_ships(fuel_req)
    ships.find_all do |ship|
      ship.fuel >= fuel_req && fully_staffed?(ship)
    end
  end

  def fully_staffed?(ship)
    recommend_personnel(ship).size >= ship.requirements.length
  end
end
