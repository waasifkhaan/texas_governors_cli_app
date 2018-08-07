class TexasGovernorsCliApp::Governor
  attr_accessor :name, :profile_url, :age, :term_in_office, :party_affiliation
    
  @@all = []  
  
  def self.all
    @@all
  end
  
  def initialize(governor_hash) 
    governor_hash.map { |key, val|
    send "#{key}=", val}
    @@all << self
  end

  def self.create_from_collection(hash_array)
    
    hash_array.map { |governor_hash|
    self.new(governor_hash)  }
  end
  
  def self.object_governors_array
    TexasGovernorsCliApp::Scraper.scraper_governors.map {|governor_hash|
    self.new(governor_hash)}
  
  end 
end 