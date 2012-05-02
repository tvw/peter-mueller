module PeterMueller

  class Company
    attr_reader :name, :address, :phonenumber, :domain, :email, :www

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

    def employees(n)
      return n.times.collect{ employee } unless block_given?
      n.times{ yield employee }
    end

    private
    def employee
      @last_ext += 1
      p = Person.new
      p.office_phonenumber = Phonenumber.new(@phonenumber.prefix, phonenumber.number, @last_ext.to_s)
      p.office_email = Email.new(p)
      p.office_email.host = @domain
      p
    end

    def domain_from_name(name)
      [
       name.split(/\-|\s/).collect{|s| Email.umlautfix(s).gsub(/[^a-zA-Z]/,"").downcase }.join("-"),
       TLD.sample,
      ].join(".")
    end

  end

end
