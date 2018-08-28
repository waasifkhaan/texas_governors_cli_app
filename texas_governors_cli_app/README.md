# TexasGovernorsCliApp

Welcome to Texas Governors CLI application. The app lists all the governors of texas in a chronological order since 1846. The data is obtained from wikipedia page https://en.wikipedia.org/wiki/List_of_Governors_of_Texas by scraping the table with nokogiri gem from  https://rubygems.org/gems/nokogiri.   

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'texas_governors_cli_app'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install texas_governors_cli_app

## Usage

Start the application by running ruby bin/run from the terminal. The applicaion will display a welcome message with 4 options. 

1. Type 'list' to print all the governors of Texas to date.
2. List 'rep' to print all the republican governors.
3. List 'dem' to print all the democratic governors.
4. Type 'exit' to quit the application. 

On typing 'list' the user will see a list of all the governors number (1-49) and in the next step user can type the associated number to get more details about the governor like party affiliation, full name , age , term in office and link to the wikipedia page for the respective governor. After providing the details the user can hit enter and get back to the main page of the application. 
On typing 'rep' the user will see a list of all the republican governors.
On typing 'dem' the user will see a list of all the governors belonging to the democratic party.
On typing 'exit' the program ends with a goodbye message.


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'waasifkhaan'/texas_governors_cli_app.
