require './leap_year-2'
require 'date'
require './test-2'

class User_3
  def initialize(name, birthday)
    @name = name
    @birthday = birthday
  end

  def born_in_leap_year?
    leap_year?(Date.parse(@birthday).year)
  end
end

if $0 == __FILE__

  class UserTest < Test_2
    def test_not_born_in_leap_year_when_born_in_2001
      user = User_3.new("Jennifer", "2001-01-01")
      assert_false(user.born_in_leap_year?)
    end

    def test_not_born_in_leap_year_when_born_in_1900
      user = User_3.new("Jennifer", "1900-01-01")
      assert_false(user.born_in_leap_year?)
    end

    def test_born_in_leap_year_when_born_in_2000
      user = User_3.new("Jennifer", "2000-01-01")
      assert_true(user.born_in_leap_year?)
    end

    def test_born_in_leap_year_when_born_in_2004
      user = User_3.new("Jennifer", "2004-01-01")
      assert_true(user.born_in_leap_year?)
    end
  end


end
