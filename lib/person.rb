class Person
  attr_reader :name, :experience, :specialties

  def initialize(name, years)
    @name = name
    @experience = years
    @specialties = []
  end

  def add_specialty(area)
    @specialties.push(area)
  end
end
