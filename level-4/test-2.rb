class Test_2

=begin
  The method inherited is called by Ruby every time the class is inherited, passing the inheriting class
(i.e. in our case the class UserTest).

  We keep track of all these classes in the array that is stored on the instance variable @subclasses.
=end
  class << self
    def inherited(subclass)
      subclasses << subclass
    end

    def subclasses
      @subclasses ||= []
    end
  end

  def run
    tests = methods.select { |method| method.to_s.start_with?("test_") }
    tests.each { |test| send(test) }
  end

  def assert_true(actual)
    assert_equal(true, actual)
  end

  def assert_false(actual)
    assert_equal(false, actual)
  end

  def assert_equal(expected, actual)
    line = caller.detect { |line| line.include?("test_") }
    method = line =~ /(test_.*)'/ && $1
    if expected == actual
      puts "#{method} #{actual} is #{expected} as expected."
    else
      puts "KAPUTT! #{method} #{actual} is not #{expected} as expected."
    end
  end

  #You can tell Ruby to execute code before it exits (i.e. terminates the program)
  at_exit do
    Test_2.subclasses.each do |subclass|
      test = subclass.new
      test.run
    end
  end
=begin
    The method at_exit takes a block that is called an “exit hook”. I.e. we tell Ruby to execute the block that we’ve
    hooked up right before Ruby terminates the program, and “exits”.

    In this block we take each of the subclasses of the class Test (in our case that is going to be just one class, the
    class UserTest), instantiate it, and call run on the instance.
=end
end
