module PeterMueller

  # A fictitious company.
  # This is how you create a company with 3 employees:
  #
  #   c = Company.new
  #   puts c
  #   c.employees(3).each do |e|
  #     puts e
  #   end
  class Company
    # The company name.
    attr_reader :name
    # The Address of the company.
    attr_reader :address
    # The Phonenumber of the company.
    attr_reader :phonenumber
    # The second level domain of the company for generating internet addresses.
    attr_reader :domain
    # The Email of the company.
    attr_reader :email
    # The World-Wide-Web-address of the company.
    attr_reader :www

    # Creates a new company.
    def initialize
      @name = Person.new.lastname + ' ' + FORM_OF_ORGANISATION.sample
      @address = Address.new
      @phonenumber = Phonenumber.new(@address.phone_prefix)
      @phonenumber.extension = "0"
      @domain = domain_from_name(@name)
      @email = Email.new
      @email.host = domain
      @email.user = "info"
      @www = "www.#{@domain}"
      @last_ext = 99
    end

    # Creates and returns a new employee.
    def employee
      @last_ext += 1
      p = Person.new
      p.office_phonenumber = Phonenumber.new(@phonenumber.prefix, phonenumber.number, @last_ext.to_s)
      p.office_email = Email.new(p)
      p.office_email.host = @domain
      p
    end

    # Returns n employees as an array or via a block.
    def employees(n)
      return n.times.collect{ employee } unless block_given?
      n.times{ yield employee }
    end

    # The string representation of the company.
    def to_s
      fields = []
      fields << name
      fields << ""
      fields << address.to_s
      fields << ""
      fields << "Telefon: #{phonenumber}"
      fields << "E-Mail: #{email}"
      fields << "WWW: #{www}"
      fields.join("\n")
    end


    private
    def domain_from_name(name)
      [
       name.split(/\-|\s/).collect{|s| Email.umlautfix(s).gsub(/[^a-zA-Z]/,"").downcase }.join("-"),
       TLD.sample,
      ].join(".")
    end

  end

end
