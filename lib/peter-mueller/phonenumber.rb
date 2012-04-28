module PeterMueller

  class Phonenumber
    attr_accessor :number, :extension

    # Returns a mobile phonenumber.
    def self.mobile
      Phonenumber.new MOBILE_PREFIXES.sample
    end

    def initialize(prefix = Address.new.phone_prefix, number = nil, extension = nil)
      @prefix = prefix.gsub(/\A0/,"")

      if number
        @number = number
      elsif landline?
        @number = ([rand(2..9).to_s] + (rand(3..7).times.collect{rand(0..9).to_s})).join("")
      else
        @number = ([rand(2..9).to_s] + (7.times.collect{rand(0..9).to_s})).join("")
      end

      @extension = extension.to_s
    end

    # the prefix
    def prefix
      "0#{@prefix}"
    end

    # true, when a landline number.
    def landline?
      @prefix =~ /\A[2-9]/
    end

    # true, when a mobile number.
    def mobile?
      @prefix =~ /\A1/
    end

    # true, when number has an extension.
    def extension?
      @extension != ""
    end
    

    # Returns a phonenumber with extension for this phonenumber.
    def phonenumber_with_extension(extension)
      Phonenumber.new(prefix, number, extension)
    end

    # String representation of the phonenumber.
    def to_s
      if extension?
        "#{prefix}-#{number}-#{extension}"
      else
        "#{prefix}-#{number}"
      end
    end

    # String representation of the phonenumber in international format.
    def to_international
      if extension?
        "+49 #{@prefix} #{number}/#{extension}"
      else
        "+49 #{@prefix} #{number}"
      end
    end
  end

end
