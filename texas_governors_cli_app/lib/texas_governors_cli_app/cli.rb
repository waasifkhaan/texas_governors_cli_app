class TexasGovernorsCliApp::CLI 
  LINE = "--------------------------------------------------------------------------------"
  
  def call 
    puts "Welcome to the app for the chronological history of Governors from the state of Texas since 1846".blue
    puts "Type 'list' to print all the governors of the state of Texas OR "
    # puts LINE.red  
    puts "Type 'rep' to list all the governors of the republican party OR ".red
    # puts LINE.blue
    puts "Type 'dem' to list all the governors of the democtatic party OR ".blue
    # puts LINE
    puts "Type 'exit' to quit this application ".red
    # puts LINE
    start
  end 
  
  def start 
    input = STDIN.gets.strip.downcase 
      if input =="list"  
        list_governor_names
        puts LINE
      elsif input == "rep"
        list_republican_governors
      elsif input == "dem"
        list_democratic_governors
      elsif input == "exit"
        leave
      else 
        call
      end 
    start until input == "exit"
  end 
  
  def list_governor_names
    
    TexasGovernorsCliApp::Governor.create_from_collection.each.with_index(1) do |governor_object,i|
      if governor_object.party_affiliation == "Democratic Party"
        puts"#{i}. #{governor_object.name}".blue 
      elsif  governor_object.party_affiliation == "Republican Party"
        puts "#{i}. #{governor_object.name}".red  
      else 
      puts"#{i}. #{governor_object.name}"
      end 
    end 
    puts "Which repectable governor would you like to get more information about ?"
    governor_details
    call
    end
  
  def governor_details
    input = STDIN.gets.strip.downcase 
    if input.to_i.between?(1,TexasGovernorsCliApp::Governor.create_from_collection.size)
      governor = TexasGovernorsCliApp::Governor.create_from_collection[input.to_i - 1]
      if governor.party_affiliation == "Republican Party"
        puts governor.name.red
        puts governor.party_affiliation.red
      elsif governor.party_affiliation == "Democratic Party"
        puts governor.name.blue
        puts governor.party_affiliation.blue
      else 
        puts governor.name
        puts governor.party_affiliation
      end 
      puts governor.age
      puts governor.term_in_office
      puts governor.profile_url
      puts LINE
    else
    end
    
  end 
  
  def list_republican_governors
    TexasGovernorsCliApp::Governor.create_from_collection.each.with_index(1) do |governor,i|
      puts "#{i}.#{governor.name}".red if governor.party_affiliation == "Republican Party"
      # Each governor index number is the same as the one in the original list in order to provide a chronological list.
    end 
    puts "Which repectable governor would you like to get more information about ?"
    governor_details
    call
  end 
  
  def list_democratic_governors
    TexasGovernorsCliApp::Governor.create_from_collection.each.with_index(1) do |governor,i|
    puts "#{i}.#{governor.name}".blue if governor.party_affiliation == "Democratic Party"
    end
    puts "Which repectable governor would you like to get more information about ?"
    governor_details
    call
    # Each governor index number is the same as the one in the original list in order to provide a chronological list.
  end 
  
  def leave 
    puts " We appreciate you for using this application and hope you got the information required"
  end 
    
  
end 
