require "date"
require "./user"

def leap_year?(year)
  year % 400 == 0 or year % 100 != 0 and year % 4 == 0
end

describe User do
  subject{ User.new("Francisca", "#{year}-01-01") }

  context "born in 2001" do
    let(:year) { 2001 }
    it "returns the name" do
      expect(subject.name).to eq "Francisca"
    end
    it { should_not be_born_in_leap_year }
  end

  context "born in 1900" do
    let(:year) { 1900 }
    #using a custom matcher called "be_named" at the EOF
    it { should be_named("Francisca") }
    it { should_not be_born_in_leap_year }
  end

  context "born in 2000" do
    let(:year) { 2000 }
    it { should be_born_in_leap_year }
  end

  context "born in 2004" do
    let(:year) { 2004 }
    it { should be_born_in_leap_year }
  end
end

#custom matcher
RSpec::Matchers.define(:be_named) do |expected|
  match do |object|
    object.name == expected
  end
end
