class TexasGovernorsCliApp::Scraper
  attr_accessor :doc, :name, :profile_url, :born_death_date, :age, :term_in_office, :party_affiliation, :elected_year
  
  def get_page
    
    Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Governors_of_Texas#Governors_of_Texas"))
    
  end 
  
  def list_governors 
    array_governors = []
    title = get_page.search(".wikitable")

      title[1].css("tr").each do |tr_list|
        scraped_governor = {}
        small_list = tr_list.search("small")
        scraped_governor[:name] = tr_list.css("td big").first.text
        scraped_governor[:age] = small_list[1].text.gsub(/[()]/, "")
        scraped_governor[:profile_url] = "https://en.wikipedia.org#{tr_list.css("td big b a").attribute("href").value}"
        scraped_governor[:born_death_date] = tr_list.css("td")[3].css("small").first.text  
        scraped_governor[:elected_year] = tr_list.css("td")[6].text
        scraped_governor[:term_in_office] = "#{tr_list.css("td")[4].children[0].text} - #{tr_list.css("td")[4].children[0].text.gsub(/[\n]/, '')}"
        scraped_governor[:party_affiliation] = tr_list.css("td")[5].text
        
        array_governors << scraped_governor 
    end
    array_governors
    binding.pry
  end 
end 