module PeterMueller

  class Address
    attr_reader :zip, :town, :street_name, :street_number, :phone_prefix

    def initialize
      (@zip, @phone_prefix, @town) = TOWNS.sample.split("\t")
      @street_name = STREETS.sample
      @street_number = rand(1..120).to_s + (rand(30)==15 ? ('a'..'e').to_a.sample : "")
    end

    # The streetname and the streetnumber.
    def street
      "#{@street_name} #{@street_number}"
    end
  end

end
