=begin
  Test an user input if is an Integer or a Float number
=end

def test_number(input)
  if input == input.to_i.to_s
    puts "It's a Integer"
  elsif input == input.to_f.to_s
    puts "It's a Float"
  else
    raise "#{input} it is not a Integer or Float!"
  end
end

print 'Enter a input: '
user_input = gets.chomp

begin
  test_number(user_input)
rescue StandardError => e
  puts e.message
  puts e.backtrace
end
