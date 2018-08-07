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
      arr = []
      final = title[1].css("tr").drop(1)
      list_48 = final.each do |tr_list|
      arr << tr_list if tr_list.css("td").length >= 6
        end
        
       arr.each do |tr_list|
      
        
        scraped_governor = {}
        
        
        scraped_governor[:name] = tr_list.css("td big b a").text.chomp
        
        scraped_governor[:age] = tr_list.css("td small").text[0..-13].concat(' Years)')
                                        
        scraped_governor[:term_in_office] = tr_list.css("td")[4].text[0..-2]
        
        scraped_governor[:party_affiliation] = tr_list.css("td")[5].text[0..-2].concat(' Party')
        
        scraped_governor[:profile_url] = "https://en.wikipedia.org#{tr_list.css("td big b a").attribute("href").value}"
        
        array_governors << scraped_governor 
    end
    line = "--------------------------------------------"
    i = 0 
    while i < arr.length - 1
    puts i = i + 1 
    
    if array_governors[i][:party_affiliation] == "Democratic Party"
      
    puts array_governors[i][:name].blue 
    
    elsif array_governors[i][:party_affiliation] == "Republican Party"
      puts array_governors[i][:name].red
    else 
      puts array_governors[i][:name]
    end 
    # puts array_governors[i][:age]
    # puts array_governors[i][:term_in_office]
    # puts array_governors[i][:party_affiliation]
    # puts array_governors[i][:profile_url]
    puts line
  end 
    end 
    
    
    # #puts array_governors[i][:term_in_office]
    # puts array_governors[i][:party_affiliation]
    # #puts array_governors[i][:elected_year]
    # puts array_governors[i][:profile_url]
    
    
  #end 
end