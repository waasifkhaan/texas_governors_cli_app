class TexasGovernorsCliApp::Governor
  attr_accessor :name, :profile_url, :age, :term_in_office, :party_affiliation
  @@all = []  
  
  def self.all
    # binding.pry
    @@all
  end
  
  
  def initialize(governor_hash) 
    governor_hash.each{ |key, val|
    send "#{key}=", val}
    @@all << self
  end

  def self.create_from_collection
    TexasGovernorsCliApp::Scraper.new.scraper_governors.each { |governor_hash|
    self.new(governor_hash)  }
  end
  
  def self.republicans
    rep = []
    @@all.each { |governor|
    rep << governor if governor.party_affiliation =="Republican Party"
    }
    rep 
    end 
  
  def self.democrats
    dem = []
    @@all.each{ |governor|
    dem << governor if governor.party_affiliation == "Democratic Party"
    }
    dem
  end       
  
end 