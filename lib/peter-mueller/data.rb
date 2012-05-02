module PeterMueller
  
  # An array male firstnames.
  FIRSTNAMES_MALE = []

  # An array of female firstnames.
  FIRSTNAMES_FEMALE = []

  # An array of lastnames.
  LASTNAMES = []

  # An array of streetnames.
  STREETS = []

  # An array of towns. The string is composed of 3 strings seperated by tabs (\\t):
  # zip, phone_prefix, name of the town.
  TOWNS = []

  # An array of prefixes for mobile phone numbers.
  MOBILE_PREFIXES = []

  # An array of domains of freemail provider.
  FREEMAIL_PROVIDER = []

  # An array of TLDs.
  TLD = ["de", "com", "net", "org", "biz", "info", "name"]

  # An array of abbreviations of form organisations.
  FORM_OF_ORGANISATION = ['AG', 'GmbH', 'oHG', 'KG', 'GbR']

  private
  def self.loaddata(konst, filename)
    fullpath = File.join(File.dirname(__FILE__), "data", filename)
    File.open(fullpath, "r").each_line do |s|
      konst << s.strip unless s.strip =~ /\A\s*\z/
    end
  end

  # Ladies first:
  loaddata(FIRSTNAMES_FEMALE, 'vornamen_frauen.txt')
  loaddata(FIRSTNAMES_MALE, 'vornamen_maenner.txt')
  loaddata(LASTNAMES, 'nachnamen.txt')
  loaddata(STREETS, 'strassen.txt')
  loaddata(TOWNS, 'orte.txt')
  loaddata(MOBILE_PREFIXES, 'mobilvorwahlen.txt')
  loaddata(FREEMAIL_PROVIDER, 'freemail_provider.txt')
end
