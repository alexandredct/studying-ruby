class Person

  attr_reader :first, :last

  #Validating the asignment for the "first" attribute
  def first=(first)
    if first == nil or first.size == 0
      raise ArgumentError.new('First name is required')
    end
    first = first.dup
    first[0] = first[0].chr.capitalize
    @first = first
  end

  #Validating the asignment for the "last" attribute
  def last=(last)
    if last == nil or last.size == 0
      raise ArgumentError.new('Last name is required')
    end
    @last = last.upcase
  end

  def full_name
    "#{@last}, #{@first}"
  end

  def initialize(first, last)
    self.first = first
    self.last = last
  end
end



#Test 1
puts "Teste 1 - using the initialize"
jacob = Person.new('Jacob', 'Berendes')
puts jacob.full_name


#Test 2
puts "Test 2 - changing object variable"
john = Person.new('john', 'von Neumann')
puts john.full_name
john.first = 'john'
puts john.first
john.first = nil
puts john.first


#Test 3
puts "Test 3 - forcing exception"
Person.new('Kero, international football star and performance artist', nil)
