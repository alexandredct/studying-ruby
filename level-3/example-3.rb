=begin
  Testing a call to a missing method
=end
class Test

  #If no method is defined with the name
  def method_missing(m, *args, &block)
    puts "There's no method called \"#{m}\""
  end

end

Test.new.abcd
