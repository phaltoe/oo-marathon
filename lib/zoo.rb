class Zoo
  attr_reader :zoo_name
  attr_reader :season_opening_date
  attr_reader :season_closing_date
  attr_reader :cages
  attr_reader :employees

  def initialize(zoo_name, season_opening_date, season_closing_date)
    @zoo_name = zoo_name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = Array.new(10) {Cage.new}
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    if date >= season_opening_date && date <= season_closing_date
      true
    else
      false
    end
  end

  def empty_cage
    cages.select { |cage| cage.empty?}.first
  end

  def add_animal(animal)
    cage = empty_cage
    raise ZooAtCapacity if cage.nil?
    cage.animal = animal
  end

  def visit
    string = ""
    employees.each do |employee|
      string << employee.greet + "\n"
    end

    cages.each do |cage|
      unless cage.empty?
        string << cage.animal.speak + "\n"
      end
    end
    string
  end
end

class ZooAtCapacity < StandardError
end
