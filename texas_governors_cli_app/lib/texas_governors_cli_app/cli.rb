class TexasGovernorsCliApp::CLI 
  def call 
  
    start 
  
  end 
  
  def start 
    puts "Welcome to the app for the chronological history of Governors that served the 
    state of Texas since 1846 ".blue
    puts "Here is the list of Governors "
    TexasGovernorsCliApp::Scraper.list_governors
    puts " Select the index number to get details about the chosen Governor of the State of Texas"
    #governor_attributes
    
  end 
  
  def list_governors
    TexasGovernorsCliApp::Governor.all.each.with_index(1) do |governor, i|
      puts "#{i}. #{governor.name} served from #{governor.term_in_office}."
    end
  end
  
  def governor_attributes
    # from the selected governor from the list I want to choose the details based on the index number chosen and then display 
    puts "#{governor.name}"
    puts "#{governor.born_death_year}"
    puts "#{governor.age}"
    puts "#{governor.party_affiliation}"
    puts "#{governor.term_in_office}"
    puts "#{governor.elected_year}" 
    puts "and for more details please check out #{governor.profile_url}"
  end 



end 