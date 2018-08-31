class TexasGovernorsCliApp::Scraper
  attr_accessor :noko
  
  def initialize 
    @noko = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Governors_of_Texas#Governors_of_Texas"))
  end 
  
  def scraper_governors 
    final_array_governors = []
    array_noko_governors = []
    
    @noko.search(".wikitable")[1].css("tr").drop(1).each {|tr_list|
    array_noko_governors << tr_list if tr_list.css("td").length >= 6}
        
      array_noko_governors.each do |tr_list|
      scraped_governor = {}
      scraped_governor[:name] = tr_list.css("td big b a").text
      scraped_governor[:age] = tr_list.css("td small").text[0..-13].concat(' Years)')
      scraped_governor[:term_in_office] = tr_list.css("td")[4].text[0..-2]
      scraped_governor[:party_affiliation] = tr_list.css("td")[5].text[0..-2].concat(' Party')
      scraped_governor[:profile_url] = "https://en.wikipedia.org#{tr_list.css("td big b a").attribute("href").value}"
      final_array_governors << scraped_governor
      end
    final_array_governors
    
  end  
   
end

  