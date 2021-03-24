class Test_1
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
end
