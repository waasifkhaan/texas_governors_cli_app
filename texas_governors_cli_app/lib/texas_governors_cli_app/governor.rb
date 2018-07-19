class TexasGovernorsCliApp::Governor
  attr_accessor :doc, :name, :profile_url, :born_death_date, :age, :term_in_office, :party_affiliation, :elected_year
  
  @@governors = [] 
  
  def self.all 
    @@governors
  end 
  
  def initialize 
    @name 
    @profile_url
    @born_death_date
    @age 
    @term_in_office
    @party_affiliation
    @elected_year
  end 
  
  def list_governors 
    title = @doc.search(".wikitable")
      title[1].css("tr").each do |tr_list|
        small_list = tr_list.search("small")
        
        governor = TexasGovernors::Governor.new  # self.new
        governor.name = tr_list.css("td big").first.text
        governor.age = small_list[1].text.gsub(/[()]/, "")
        governor.profile_url = "https://en.wikipedia.org#{tr_list.css("td big b a").attribute("href").value}"
        governor.born_death_date = tr_list.css("td")[3].css("small").first.text  
        governor.elected_year = tr_list.css("td")[6].text
        governor.term_in_office = "#{tr_list.css("td")[4].children[0].text} - #{tr_list.css("td")[4].children[0].text.gsub(/[\n]/, '')}"
        governor.party_affiliation = tr_list.css("td")[5].text
        
        @@governors << governor 
    end
  end 
end 