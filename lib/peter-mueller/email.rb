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
        @user = [
                 user_from_names(person),
                 user_from_firstname(person, ""),
                 user_from_initials(person, ""),
                ].sample

        @host = [
                 user_from_names(person),
                 TLD.sample,
                ].join(".")
      else
        @user = [
                 user_from_names(person),
                 user_from_firstname(person),
                 user_from_initials(person),
                ].sample

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

    private
    def user_from_names(person, sepchar=["","_","."].sample)
      part1 = self.class.umlautfix(person.firstname).gsub(/[^a-zA-Z]/,"").downcase
      part2 = self.class.umlautfix(person.lastname).gsub(/[^a-zA-Z]/,"").downcase
      "#{part1}#{sepchar}#{part2}"
    end

    def user_from_firstname(person, number = rand(1..9999).to_s)
      part = self.class.umlautfix(person.firstname).gsub(/[^a-zA-Z]/,"").downcase
      "#{part}#{number}"
    end

    def user_from_initials(person, number = rand(1..9999).to_s)
      part1 = self.class.umlautfix(person.firstname).gsub(/[^a-zA-Z]/,"").downcase
      part2 = self.class.umlautfix(person.lastname).gsub(/[^a-zA-Z]/,"").downcase
      "#{part1[0]}#{part2[0]}#{number}"
    end

  end

end
