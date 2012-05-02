# -*- encoding: utf-8 -*-
module PeterMueller

  # A fictitious person.
  class Person
    
    attr_reader :sex #:nodoc:
    # The firstname.
    attr_reader :firstname
    # The lastname.
    attr_reader :lastname
    # The Address.
    attr_reader :address
    # The landline Phonenumber. Not every person has a landline Phonenumber.
    attr_reader :phonenumber
    # The mobile Phonenumber. Not every person has a mobile Phonenumber.
    attr_reader :mobile
    # The mobile Email. Not every person has a Email.
    attr_reader :email
    # The office Phonenumber, only set, when the person is an employee of a Company.
    attr_accessor :office_phonenumber
    # The office Email, only set, when the person is an employee of a Company.
    attr_accessor :office_email

    # Creates a new person.
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

      @email = Email.new(self) if rand(1..100) > 35
    end

    # Whether the person is male.
    def male?
      @sex == 'm'
    end

    # Whether the person is female.
    def female?
      @sex == 'f'
    end

    # The string representation of the person.
    def to_s
      fields = []
      fields << "#{firstname} #{lastname}"
      fields << ""
      fields << address.to_s
      fields << ""
      fields << "Telefon: #{phonenumber}" if phonenumber
      fields << "Mobil: #{@mobile}" if mobile
      fields << "E-Mail: #{email}" if email
      if office_email or office_phonenumber
        fields << "\nGeschäftlich"
        fields << "Telefon: #{office_phonenumber}" if office_phonenumber
        fields << "E-Mail: #{office_email}" if office_email
      end
      fields.join("\n")
    end

  end

end
