require "spec_helper"
include PeterMueller

describe Phonenumber do
  describe "with German landline prefix" do
    subject{ Phonenumber.new '40'}

    its(:prefix){ should be_a(String) }
    its(:prefix){ should == '040' }
    
    it "has a valid number" do
      1000.times do
        pn = Phonenumber.new('40')
        pn.number.should be_a(String)
        pn.number.should match(/\A[2-9]\d{3,7}\z/)
      end
    end
  end

  describe "with a mobile prefix" do
    subject{ Phonenumber.new '172'}

    its(:prefix){ should be_a(String) }
    its(:prefix){ should == '0172' }
    
    it "has a valid number" do
      1000.times do
        pn = Phonenumber.new('172')
        pn.number.should be_a(String)
        pn.number.should match(/\A[2-9]\d{7}\z/)
      end
    end
  end

  describe "with a landline prefix" do
    it "#landline? is true" do
      TOWNS.each do |town|
        pn = Phonenumber.new town.split(/\t/)[1]
        pn.landline?.should be_true
      end
    end

    it "#mobile? is false" do
      TOWNS.each do |town|
        pn = Phonenumber.new town.split(/\t/)[1]
        pn.mobile?.should be_false
      end
    end
  end

  describe "with a mobile prefix" do
    it "#landline? is false" do
      MOBILE_PREFIXES.each do |prefix|
        pn = Phonenumber.new prefix
        pn.landline?.should be_false
      end
    end

    it "#mobile? is true" do
      MOBILE_PREFIXES.each do |prefix|
        pn = Phonenumber.new prefix
        pn.mobile?.should be_true
      end
    end
  end

  describe "#phonenumber_with_extension" do
    before{ @pn = Phonenumber.new }

    subject{ @pn.phonenumber_with_extension(102) }
    its(:extension){ should == '102' }
    its(:number){ should == @pn.number }
    its(:prefix){ should == @pn.prefix }
  end

  describe "#to_s '040-23456'" do
    subject{ Phonenumber.new('40', '23456') }
    its(:to_s){ should == "040-23456" }
    its(:to_international){ should == "+49 40 23456" }
  end

  describe "#to_s '040-23456-123'" do
    subject{ Phonenumber.new('40', '23456', '123') }
    its(:to_s){ should == "040-23456-123" }
    its(:to_international){ should == "+49 40 23456/123" }
  end

  describe "Phonenumber.mobile" do
    it "should have a mobile prefix" do
      1000.times do
        pn = Phonenumber.mobile
        pn.prefix.should satisfy{|p| MOBILE_PREFIXES.include?(p.gsub(/\A0/,"")) }
      end
    end
  end

end
