module PeterMueller

  class Person
    attr_reader :sex, :firstname, :lastname, :address, :phonenumber, :mobile
    attr_accessor :officenumber

    def initialize
      @sex = ['f','m'].sample

      if @sex == 'm'
        @firstname = FIRSTNAMES_MALE.sample
      else
        @firstname = FIRSTNAMES_FEMALE.sample
      end

      @lastname = LASTNAMES.sample

      @address = Address.new

      @phonenumber = Phonenumber.new(@address.phone_prefix) if rand(1..100) > 10
      @mobile = Phonenumber.mobile if rand(1..100) > 20
      @officenumber = nil?
    end

  end

end
