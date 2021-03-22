
greetings = lambda { |name|
  puts "Greeting #{name}"
}

message = lambda {
  puts "If you need and help you can email to contact@abc.com"
}

# =======================
class Member
  def initialize(name)
    @name = name
  end
  attr_reader :name

  # using Proc as a method parameter
  def first_steps message
    message.call
  end

end
# =======================

a = Member.new("Maria")

# Calling a proc
greetings.call(a.name)

a.first_steps(message)



