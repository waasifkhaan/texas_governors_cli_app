class TexasGovernorsCliApp::CLI 
  LINE = "--------------------------------------------"
  
  def call 
    puts "Welcome to the app for the chronological history of Governors who served the state of Texas since 1846 ".blue
    puts ""
    puts "Type list to print all the governors of the state of Texas till date : OR "
    puts "Type Rep to list all the governors of the republican party OR ".red
    puts "Type Dem to list all the governors of the democtatic party ".blue
    start
  end 
  
  def start 
    input = STDIN.gets.strip.downcase 
      if input =="list"  
        list_governor_names
      elsif input == "rep"
        list_republican_governors
      elsif input == "dem"
        list_democratic_governors
      else 
        puts " Please type list , rep or dem to go forward"
        start
      end 
    puts LINE
    puts "Type the index number of the respectable governor you would like to know more about, or type 'list' to print list of governors  or type 'exit' to quit "
    puts LINE
    puts LINE
    # if input == " list"
    #   list_governor_names
      
    # elsif input.to_i.between?(1,TexasGovernorsCliApp::Governor.create_from_collection.size)
    governor_details
    start until input == "exit"
    # elsif input == "exit"
    #   leave
    #end 
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
      puts "Type another index number for governor details  or type list to print the list of governors again"
    elsif input == "exit"
      leave
    elsif input == "list"
      list_governor_names
      puts "Type another index number for governor details  or type list to print the list of governors again OR type 'exit' to quit"
    
    else 
      puts " Please enter the correct index number to get more details."
      governor_details
    end 
    governor_details until input =="exit"
    puts LINE
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
    # Each governor index number is the same as the one in the original list in order to provide a chronological list.
  end 
  
  def leave 
    puts " We appreciate you for using this application and hope you got the information required"
  end 
    
  
end 
