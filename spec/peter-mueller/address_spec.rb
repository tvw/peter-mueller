require "spec_helper"
include PeterMueller

describe Address do

  it "has a valid zip code" do
    1000.times do
      address = Address.new
      address.zip.should match(/\A\d{5}\z/)
    end
  end

  it "should have a zip and town" do
    1000.times do
      address = Address.new
      address.should satisfy{|s| TOWNS.include? "#{s.zip}\t#{s.phone_prefix}\t#{s.town}" }
    end
  end

  it "should have a street_name" do
    1000.times do
      address = Address.new
      address.should satisfy{|s| STREETS.include? s.street_name }
    end
  end

  it "should have a valid street_number" do
    1000.times do
      address = Address.new
      address.street_number.should match(/\A\d+[a-e]{0,1}\z/)
    end
  end

end
