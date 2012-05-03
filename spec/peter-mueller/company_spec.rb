require "spec_helper"
include PeterMueller

describe Company do
  subject{ Company.new }

  it "starts with a lastname and ends with a FORM_OF_ORGANISATION" do
    1000.times do
      company = Company.new
      company.name.split(/ (?!.*? )/).length.should == 2
      company.should satisfy{|c| LASTNAMES.include?(c.name.split(/ (?!.*? )/).first)}
      company.should satisfy{|c| FORM_OF_ORGANISATION.include?(c.name.split(/ (?!.*? )/).last)}
    end
  end

  its(:address){ should be_a Address}

  describe "Company#phonenumber" do
    before{ @company = Company.new }
    subject{ @company.phonenumber }

    it{ should be_a Phonenumber}
    its(:extension){ should == "0"}
    its(:prefix){ should == "0" + @company.address.phone_prefix }
  end

  its(:domain){ should satisfy{|d| TLD.include?(d.split(".").last)} }

  describe "Company#email" do
    before{ @company = Company.new }
    subject{ @company.email }

    it{ should be_a Email }
    its(:user){ should == "info" }
    its(:host){ should == @company.domain }
  end

  describe "Company#www" do
    before{ @company = Company.new }
    subject{ @company.www }
    it{ should == "www." + @company.domain }
  end

  describe "Company#employee" do
    before{ @company = Company.new }
    subject{ @company.send(:employee) }

    it{ should be_a Person }
    its(:office_email){ should be_a Email}
    its(:office_phonenumber){ should be_a Phonenumber}

    describe "#office_phonenumber" do
      subject{ @company.send(:employee).office_phonenumber }
      its(:prefix){ should == "0" + @company.address.phone_prefix}
      its(:number){ should == @company.phonenumber.number}
      its(:extension){ should match(/\A\d{3,}\z/)}
    end

    describe "#office_email" do
      subject{ @company.send(:employee).office_email }
      its(:host){ should == @company.domain}
    end

  end

  describe "Company#employees(5)" do
    subject{ Company.new }

    it "returns an array with 5 Persons in a non block context" do
      employees = subject.employees(5)
      employees.should be_a Array
      employees.each do |e|
        e.should be_a Person
      end
    end

    it "returns 5 Persons in a block context" do
      n = 0
      subject.employees(5) do |e|
        n += 1
        e.should be_a Person
      end
      n.should == 5
    end

  end

  describe "Company#domain=" do
    before do
      subject.domain = "example.com"
    end

    its(:domain){ should == "example.com"}
    its(:www){ should == "www.example.com"}
    its("email.host"){ should == "example.com"}
    its("employee.office_email.host"){ should == "example.com"}
  end

  describe "Company#name=" do
    before do
      subject.name = "Hans Durst AG"
    end

    its(:name){ should == "Hans Durst AG"}
  end

end
