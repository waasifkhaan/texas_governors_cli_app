class TexasGovernorsCliApp::Scraper
  attr_accessor :doc, :name, :profile_url, :born_death_date, :age, :term_in_office, :party_affiliation, :elected_year
  
  def self.get_page
    Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Governors_of_Texas#Governors_of_Texas"))
  end 
  
  def self.scrap_gov 
    
  end 
  
  def self.list_governors 
    array_governors = []
    title = get_page.search(".wikitable")

      title[1].css("tr").drop(1).each do |tr_list|
        scraped_governor = {}
        binding.pry
       
        scraped_governor[:name] = tr_list.css("td big b a").text
        
        scraped_governor[:age] = tr_list.css("td small").text[0..-12]
                                        
        
        scraped_governor[:profile_url] = "https://en.wikipedia.org#{tr_list.css("td big b a").attribute("href").value}"
        scraped_governor[:elected_year] = tr_list.css("td")[6].text[0..-2]
        scraped_governor[:term_in_office] = "#{tr_list.css("td")[4].children[0].text} - #{tr_list.css("td")[4].children[0].text.gsub(/[\n]/, '')}"
        scraped_governor[:party_affiliation] = tr_list.css("td")[5].text
        
        array_governors << scraped_governor 
    end
    array_governors
    
  end 
end 