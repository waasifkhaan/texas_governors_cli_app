class TexasGovernorsCliApp::CLI 
  def call 
    line = "--------------------------------------------"
    puts "Welcome to the app for the chronological history of Governors who served the state of Texas since 1846 ".blue
    puts ""
    puts "Below is the indexed list of all the governors of the state of Texas  "
    puts ""
    list_governor_names
    puts line.red 
    puts line.blue
    puts ""
    puts ""
    puts "Type the index number between 1 through 48 to get more details : OR "
    puts "Type Rep to list all the governors from the republican party OR ".red
    puts "Type Dem to list all the governors from the democtatic party ".blue
    governor_details
    puts ""
    
    
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
            puts governor.name
            puts governor.age
            puts governor.party_affiliation
            puts governor.term_in_office
            puts governor.profile_url
            # puts " Did you want to look at the list again? y/n "
            # input = gets.chomp 
            # if input == "y"
            #   list_governor_names
            #   puts "Type the index number between 1 through 48 to get more details :".red
              
            # else
            #   nil
            # end 
        elsif input == "rep"
            list_republican_governors
        elsif input == "dem"
            list_democratic_governors
            
        else 
          puts " Please enter the correct index number to get more details."
          input = STDIN.gets.strip.downcase until input.to_i.between?(1,TexasGovernorsCliApp::Governor.create_from_collection.size)
          puts " Please enter the correct index number to get more details."
        end 
      end 
  
  def list_republican_governors
    
    TexasGovernorsCliApp::Governor.create_from_collection.each.with_index(1) do |governor,i|
    puts "#{i}.#{governor.name}".red if governor.party_affiliation == "Republican Party"
    end 
    
  end 
  
  def list_democratic_governors
    
    TexasGovernorsCliApp::Governor.create_from_collection.each.with_index(1) do |governor,i|
    puts "#{i}.#{governor.name}".blue if governor.party_affiliation == "Democratic Party"
    end
    # Each governor index number is the same as the one in the original list in order to provide a chronological list.
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
