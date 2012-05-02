module PeterMueller
  FIRSTNAMES_MALE = []
  FIRSTNAMES_FEMALE = []
  LASTNAMES = []
  STREETS = []
  TOWNS = []
  MOBILE_PREFIXES = []
  FREEMAIL_PROVIDER = []
  TLD = ["de", "com", "net", "org", "biz", "info", "name"]
  FORM_OF_ORGANISATION = ['AG', 'GmbH', 'oHG', 'KG', 'GbR']

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
