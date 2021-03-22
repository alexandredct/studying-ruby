=begin
  Testing immutability of objects
=end

# "a" and "b" points at the same String
a = b  = "A simple string. "
a.freeze

puts "Block 1 - change the String frozen"
# Attempt to change the *value* of the String pointed by "a" concatenating it
begin
  a << "An attempt to modify."
rescue FrozenError => err
  puts "Block 1: #{err.class} #{err}"
end


puts "\n\nBlock 2 - point to new String"
# Point
begin
  a = "abc"
rescue => err
  puts "#{err.class} #{err}"
end

puts "A = " + a
puts "B = " + b


puts "\n\nTest if A and B are frozen"
puts "A is frozen" if a.frozen?
puts "B is frozen" if b.frozen?