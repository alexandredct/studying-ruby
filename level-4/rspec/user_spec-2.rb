require "date"
require "./user"

def leap_year?(year)
  year % 400 == 0 or year % 100 != 0 and year % 4 == 0
end

describe User do
  let(:user) { User.new("Francisca", "#{year}-01-01") }

  context "born in 2001" do
    let(:year) { 2001 }
    it "is not born in a leap year" do
      expect(user).not_to be_born_in_leap_year
    end
  end

  context "born in 1900" do
    let(:year) { 1900 }
    specify "is not born in a leap year" do
      expect(user).not_to be_born_in_leap_year
    end
  end

  context "born in 2000" do
    let(:year) { 2000 }
    example "is born in a leap year" do
      expect(user).to be_born_in_leap_year
    end
  end

  context "born in 2004" do
    let(:year) { 2004 }
    it "is born in a leap year" do
      expect(user).to be_born_in_leap_year
    end
  end
end
