# -*- encoding: utf-8 -*-
require "spec_helper"
include PeterMueller

describe "FIRSTNAMES_FEMALE" do
  subject{ FIRSTNAMES_FEMALE }
  
  it{ should be_a Array }
  its(:length){ should == 460 }
  its(:first){ should == "Maria"}
  its(:last){ should == "Natalja"}
end

describe "FIRSTNAMES_MALE" do
  subject{ FIRSTNAMES_MALE }
  
  it{ should be_a Array }
  its(:length){ should == 540 }
  its(:first){ should == "Peter"}
  its(:last){ should == "Rocco"}
end

describe "LASTNAMES" do
  subject{ LASTNAMES }
  
  it{ should be_a Array }
  its(:length){ should == 1000 }
  its(:first){ should == "Müller"}
  its(:last){ should == "Ertl"}
end

describe "STREETS" do
  subject{ STREETS }
  
  it{ should be_a Array }
  its(:length){ should == 1000 }
  its(:first){ should == "Hauptstr."}
  its(:last){ should == "Neumarkt"}
end

describe "TOWNS" do
  subject{ TOWNS }
  
  it{ should be_a Array }
  its(:length){ should == 1000 }
  its(:first){ should == "50354	2233	Hürth"}
  its(:last){ should == "42853	2191	Remscheid"}
end

describe "MOBILE_PREFIXES" do
  subject{ MOBILE_PREFIXES }
  
  it{ should be_a Array }
  its(:length){ should == 53 }
  its(:first){ should == "1510"}
  its(:last){ should == "179"}
end

describe "FREEMAIL_PROVIDER" do
  subject{ FREEMAIL_PROVIDER }
  
  it{ should be_a Array }
  its(:length){ should == 8 }
  its(:first){ should == "aol.de"}
  its(:last){ should == "web.de"}
end
