class Human
  def make_noise
    puts "Bla bla bla"
  end
end
#==============================
class Cat
  def make_noise
    puts "Meeeow!"
  end
end
#==============================
class Dog
  def make_noise
    puts "Woof woof woof!"
  end
end
#==============================

def call(animal)
  animal.make_noise
end

call(Human.new)
call(Dog.new)
call(Cat.new)
