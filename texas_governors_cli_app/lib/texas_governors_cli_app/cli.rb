class TexasGovernorsCliApp::CLI 
  LINE = "--------------------------------------------------------------------------------"
  
  def menu 
    puts LINE
    puts "Welcome to the app for the chronological history of Governors from the state of Texas since 1846".blue
    puts LINE 
    puts "Type 'list' to print all the governors of the state of Texas OR "
    puts "Type 'rep' to list all the governors of the republican party OR ".red
    puts "Type 'dem' to list all the governors of the democtatic party OR ".blue
    puts "Type 'exit' to quit this application ".red
    puts LINE
  end 
  
  def call 
    start
  end 
  
  def start 
    input = "" 
    until input == "exit"
    menu
    input = STDIN.gets.strip.downcase 
    
      if input =="list"  
        list_governor_names
      elsif input == "rep"
        list_republican_governors
      elsif input == "dem"
        list_democratic_governors
      else
        puts "Please type correctly "
      end
    
    end 
  leave 
  end 
  
  def list_governor_names
    TexasGovernorsCliApp::Governor.create_from_collection.each.with_index(1) do |governor_object,i|
      if governor_object.party_affiliation== "Democratic Party"
        puts"#{i}. #{governor_object.name}".blue 
      elsif  governor_object.party_affiliation == "Republican Party"
        puts "#{i}. #{governor_object.name}".red  
      else 
      puts"#{i}. #{governor_object.name}"
      end 
    end
    puts LINE
    puts "Please type the index 'number' to get more information about the honourable governor   ?"
    puts LINE
    governor_details
    
  end
  
  def governor_details
    input = STDIN.gets.strip.downcase 
    if input.to_i.between?(1,TexasGovernorsCliApp::Governor.create_from_collection.size)
      governor = TexasGovernorsCliApp::Governor.create_from_collection[input.to_i - 1]
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
      puts "Enter to go back to the main menu " 
      input = gets.chomp 
      
      
    
    end
    
  end 
  
  def list_republican_governors
    TexasGovernorsCliApp::Governor.create_from_collection.each.with_index(1) do |governor,i|
      puts "#{i}.#{governor.name}".red if governor.party_affiliation == "Republican Party"
      # Each governor index number is the same as the one in the original list in order to provide a chronological list.
    end 
    
    
  end 
  
  def list_democratic_governors
    TexasGovernorsCliApp::Governor.create_from_collection.each.with_index(1) do |governor,i|
    puts "#{i}.#{governor.name}".blue if governor.party_affiliation == "Democratic Party"
    end
    puts LINE
    
    
    # Each governor index number is the same as the one in the original list in order to provide a chronological list.
  end 
  
  def leave 
    puts LINE
    puts " Thank you for using the CLI_Texas_Governor gem application, hope it was informative."
    puts LINE.blue 
    puts LINE.red
  end 
end 
