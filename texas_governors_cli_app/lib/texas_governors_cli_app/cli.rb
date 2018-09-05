class TexasGovernorsCliApp::CLI 
  LINE = "--------------------------------------------------------------------------------"
  
  def menu 
    puts LINE
    puts "Welcome to the app for the chronological history of Governors from the state of Texas since 1846".blue
    puts LINE 
    puts "Type 'list' to print all the governors of the state of Texas OR "
    puts "Type 'rep' to list all the governors belonging to the republican party OR ".red
    puts "Type 'dem' to list all the governors belonging to the democtatic party OR ".blue
    puts "Type 'exit' to quit this application ".red
    puts LINE
  end 
  
  def call 
    TexasGovernorsCliApp::Governor.create_from_collection
    start
  end 
  
  def start 
    input = "" 
    until input == "exit"
    menu
    input = STDIN.gets.strip.downcase 
    
      if input =="list"
        list_governor_names(TexasGovernorsCliApp::Governor.all)  
      elsif input == "rep"
         list_governor_names(TexasGovernorsCliApp::Governor.republicans) 
      elsif input == "dem"
        list_governor_names(TexasGovernorsCliApp::Governor.democrats) 
      else
        nil
      end
    end 
    
  leave
  
  end 
  
  def list_governor_names(governors)
    governors.each.with_index(1) do |governor_object,i|
      # binding.pry 
      if governor_object.party_affiliation== "Democratic Party"
        puts"#{i}. #{governor_object.name}".blue 
      elsif  governor_object.party_affiliation == "Republican Party"
        puts "#{i}. #{governor_object.name}".red  
      else 
      puts"#{i}. #{governor_object.name}"
      end 
    end
    puts LINE
    puts "Please type the index 'number' to get more information about the honourable governor."
    puts LINE
    governor_details(governors)
  end
  
  def governor_details(governors)
    input = STDIN.gets.strip.downcase 
    if input.to_i.between?(1,TexasGovernorsCliApp::Governor.all.size)
      governor = governors[input.to_i - 1]
      if governor.party_affiliation == "Republican Party"
        puts governor.name.red
        puts governor.party_affiliation.red
        puts "Age: #{governor.age}".red
        puts "Term in Office: #{governor.term_in_office}".red 
        puts governor.profile_url.red 
      elsif governor.party_affiliation == "Democratic Party"
        puts governor.name.blue
        puts governor.party_affiliation.blue
        puts "Age: #{governor.age}".blue
        puts "Term in Office: #{governor.term_in_office}".blue 
        puts governor.profile_url.blue 
      else 
        puts governor.name
        puts governor.party_affiliation
        puts "Age: #{governor.age}"
        puts "Term in Office: #{governor.term_in_office}" 
        puts governor.profile_url
      end
      puts LINE
      puts "Would you like to see another governor from the list ?"
      puts "Type 'yes' to see another governor OR 'any other key' to go back to the main menu" 
      input = STDIN.gets.strip.downcase 
      if input =="yes"
        list_governor_names(governors)
      else 
        return
      end   
    else 
      puts " Please type a valid index number "
      governor_details(governors)
    end
  
  end 
  
  def leave 
    puts LINE
    puts "Thank you for using the CLI_Texas_Governor gem application, hope it was informative."
    puts LINE.blue 
    puts LINE.red
  end 
end 
