module PeterMueller

  # A fictitious address. The address should look valid, but is not an existing address.
  # The street might not even exist in the town. But, by accident, the address could exist.
  class Address
    # The zip code (PLZ).
    attr_reader :zip

    # Name of the town, the street and its numner.
    attr_reader :town, :street_name, :street_number

    # The landline phone prefix for the address. This can be used, when
    # generating a Phonenumber which should fit with the address.
    attr_reader :phone_prefix

    # Creates a new Address.
    def initialize
      (@zip, @phone_prefix, @town) = TOWNS.sample.split("\t")
      @street_name = STREETS.sample
      @street_number = rand(1..120).to_s + (rand(30)==15 ? ('a'..'e').to_a.sample : "")
    end

    # The streetname and the streetnumber in one string.
    def street
      "#{@street_name} #{@street_number}"
    end

    # The string representation of the address.
    def to_s
      "#{street}\n#{zip} #{town}"
    end

  end

end
