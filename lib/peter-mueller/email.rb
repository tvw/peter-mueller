# -*- encoding: utf-8 -*-
module PeterMueller

  # Creates fictitious email address.
  class Email
    # User-part of the address.
    attr_accessor :user
    # Host-part of the address.
    attr_accessor :host

    # Creates a new email address.
    def initialize(person = Person.new, owndomain = (rand(1..50) == 2))
      if owndomain
        [
         lambda{ user_from_names(person) },
         lambda{ user_from_firstname(person, "") },
         lambda{ user_from_initials(person, "") },
        ].sample.call

        @host = [
                 from_names(person),
                 TLD.sample,
                ].join(".")
      else
        [
         lambda{ user_from_names(person) },
         lambda{ user_from_firstname(person) },
         lambda{ user_from_initials(person) },
        ].sample.call

        @host = FREEMAIL_PROVIDER.sample
      end
    end

    # Returns the string representation of the email address.
    def to_s
      "#{@user}@#{@host}"
    end

    def self.umlautfix(str) #:nodoc:
      str.
        gsub("ä","ae").
        gsub("ö","oe").
        gsub("ü","ue").
        gsub("Ä","Ae").
        gsub("Ö","Oe").
        gsub("Ü","Ue").
        gsub("ß","ss")
    end

    # Generates the user-part from the names of a Person.
    def user_from_names(person, sepchar=["","_","."].sample)
      @user = from_names(person, sepchar)
    end

    # Generates the user-part from the firstname and a number.
    def user_from_firstname(person, number = rand(1..9999).to_s)
      part = self.class.umlautfix(person.firstname).gsub(/[^a-zA-Z]/,"").downcase
      @user = "#{part}#{number}"
    end

    # Generates the user-part from the initials and a number.
    def user_from_initials(person, number = rand(1..9999).to_s)
      part1 = self.class.umlautfix(person.firstname).gsub(/[^a-zA-Z]/,"").downcase
      part2 = self.class.umlautfix(person.lastname).gsub(/[^a-zA-Z]/,"").downcase
      @user = "#{part1[0]}#{part2[0]}#{number}"
    end

    private
    def from_names(person, sepchar=["","_","."].sample)
      part1 = self.class.umlautfix(person.firstname).gsub(/[^a-zA-Z]/,"").downcase
      part2 = self.class.umlautfix(person.lastname).gsub(/[^a-zA-Z]/,"").downcase
      "#{part1}#{sepchar}#{part2}"
    end
  end

end
