
class Visitor


  def name=(first_name)
    @first_name = first_name.downcase.capitalize
  end

  def surname=( last_name)
    @last_name = last_name.upcase
  end

  def full_name()
    puts "#{@last_name}, #{@first_name}"
  end
end

#===================

person_1 = Visitor.new
person_1.name=("carlos")
person_1.surname = "mArtiNs"
puts person_1.full_name
