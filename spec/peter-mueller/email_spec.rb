# -*- encoding: utf-8 -*-
require "spec_helper"
include PeterMueller

describe Email do
  before do
    @person = double("person")
    @person.stub(:firstname).and_return("Peter")
    @person.stub(:lastname).and_return("Müller")
  end
  subject{ Email.new(@person) }

  describe "mocked Person" do
    subject{ @person }
    its(:firstname){ should == "Peter" }
  end

  describe "#umlautfix" do
    it "should replace umlaute properly" do
      subject.class.send(:umlautfix, "ä").should == "ae"
      subject.class.send(:umlautfix, "ö").should == "oe"
      subject.class.send(:umlautfix, "ü").should == "ue"
      subject.class.send(:umlautfix, "Ä").should == "Ae"
      subject.class.send(:umlautfix, "Ö").should == "Oe"
      subject.class.send(:umlautfix, "Ü").should == "Ue"
      subject.class.send(:umlautfix, "ß").should == "ss"

      subject.class.send(:umlautfix, "Äötiß").should == "Aeoetiss"
    end
  end

  describe ".user_from_names" do
    it "should return a username" do
      subject.user_from_names(@person, "").should == "petermueller"
      subject.user_from_names(@person, "_").should == "peter_mueller"
      subject.user_from_names(@person, ".").should == "peter.mueller"
    end
  end

  describe ".user_from_firstname" do
    it "should return a username" do
      subject.user_from_firstname(@person, 12).should == "peter12"
    end
  end

  describe "#user_from_initials" do
    it "should return a username" do
      subject.user_from_initials(@person, 333).should == "pm333"
    end
  end

  describe "#to_s" do
    it "is a proper email" do
      subject.user = "paul"
      subject.host = "web.de"
      subject.to_s.should == "paul@web.de"
    end
  end

end
