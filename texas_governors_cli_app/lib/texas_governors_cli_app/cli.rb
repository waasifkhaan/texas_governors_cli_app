class TexasGovernorsCliApp::CLI 
  def call 
    line = "--------------------------------------------"
    puts "Welcome to the app for the chronological history of Governors that served the 
    state of Texas since 1846 ".blue
    puts "Here is the list of Governors "
    self.governor_details
    puts line.red 
    puts line.blue
    puts ""
    puts ""
    puts "Type the index number to get more details about the Governor :".red 
    puts ""
    #governor_attributes
    
  end 
  
  def governor_details
    
    TexasGovernorsCliApp::Scraper.list_governors.each_with_index do |governor_object,i|
      if governor_object.party_affiliation == "Democratic Party"
        puts"#{i}. #{governor_object.name}".blue 
      elsif  governor_object.party_affiliation == "Republican Party"
        puts "#{i}. #{governor_object.name}".red  
      else 
      puts"#{i}. #{governor_object.name}"
      end  
      
      
    end
  end 
  
  
  # line = "--------------------------------------------"
  #   i = 0 
  #   while i < array_noko_governors.length - 1
  #   puts i = i + 1 
    
    
  #   if final_array_governors[i][:party_affiliation] == "Democratic Party"
      
  #   puts final_array_governors[i][:name].blue 
  #   puts final_array_governors[i][:party_affiliation].blue
    
  #   elsif final_array_governors[i][:party_affiliation] == "Republican Party"
  #     puts final_array_governors[i][:name].red
  #     puts final_array_governors[i][:party_affiliation].red
  #   else 
  #     puts final_array_governors[i][:name]
  #     puts final_array_governors[i][:party_affiliation]
  #   end 
  #   puts final_array_governors[i][:age]
  #   puts final_array_governors[i][:term_in_office]
  #   puts final_array_governors[i][:profile_url]
  #   puts line.green
  #   end 
      
    
  # end 
  
  # def governor_attributes
  #   # from the selected governor from the list I want to choose the details based on the index number chosen and then display 
  #   puts "#{governor.name}"
  #   puts "#{governor.born_death_year}"
  #   puts "#{governor.age}"
  #   puts "#{governor.party_affiliation}"
  #   puts "#{governor.term_in_office}"
  #   puts "#{governor.elected_year}" 
  #   puts "and for more details please check out #{governor.profile_url}"
  # end 


end 
