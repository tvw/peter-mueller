require "spec_helper"
include PeterMueller

describe Person do
  subject{ Person.new }

  it "#sex should be 'f' or 'm'" do
    1000.times do
      person = Person.new
      person.sex.should satisfy{|v| ['m','f'].include?(v)}
    end
  end

  it "#firstname should be a female or a male firstname depending on the sex" do
    1000.times do
      person = Person.new
      person.should satisfy do |s|
        ((s.sex == 'm') ? FIRSTNAMES_MALE : FIRSTNAMES_FEMALE).include?(s.firstname)
      end
    end
  end

  it "#lastname should be a lastname" do
    1000.times do
      person = Person.new
      person.should satisfy{|s| LASTNAMES.include?(s.lastname) }
    end
  end


  its(:address){ should be_a Address }

end
