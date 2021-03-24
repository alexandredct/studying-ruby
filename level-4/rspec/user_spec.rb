require "date"

def leap_year?(year)
  year % 400 == 0 or year % 100 != 0 and year % 4 == 0
end

class User
  def initialize(name, birthday)
    @name = name
    @birthday = birthday
  end

  def name
    @name
  end

  def born_in_leap_year?
    leap_year?(Date.parse(@birthday).year)
  end
end

=begin
  RSpec defines methods like describe, it, expect, and eq (equal).

  Using these methods we can describe our expectations about our code and execute them. In RSpec’s thinking, that’s
  what tests are all about: expressing our expectations about the behaviour of our code. We describe the class User,
  and specify our expectations
=end

describe User do
  #Instead of "it" you can also use "example". That’s exactly the same
  it "is born in a leap year when born in 2000" do
    user = User.new("Francisca", "2000-01-01")
    #The method eq returns an RSpec matcher that simply tests if the object passed to expect is equal to the object passed to eq.
    expect(user.born_in_leap_year?).to eq true

    #other built in matchers https://relishapp.com/rspec/rspec-expectations/v/3-5/docs/built-in-matchers
  end

  #using context to group "it" / "examples"" / "specify""
  context "born in 2001" do
    it "is not born in a leap year" do
      user = User.new("Francisca", "2001-01-01")
      expect(user).not_to be_born_in_leap_year
    end
  end

  context "born in 1900" do
    specify "is not born in a leap year" do
      user = User.new("Francisca", "1900-01-01")
      expect(user).not_to be_born_in_leap_year
    end
  end

  context "born in 2000" do
    it "is born in a leap year" do
      user = User.new("Francisca", "2000-01-01")
      expect(user).to be_born_in_leap_year
    end
  end

  context "born in 2004" do
    it "is born in a leap year" do
      user = User.new("Francisca", "2004-01-01")
      expect(user).to be_born_in_leap_year
    end
  end
end
