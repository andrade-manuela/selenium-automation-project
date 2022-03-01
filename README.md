# selenium-automation-project

The goal of this project is to run automated tests in a web based application using Selenium-webriver with ruby. In order to make it more powerful and ornanized I also used Capybara and RSpec.

Dependencies:
- You just need to install Bundler.

Ruby - https://rubyinstaller.org/downloads/
Bundler - gem install bundler
RSpec (used for assertions) - gem install rspec
Capybara (used to simulate the real user in a application) - gem install capybara

# How to install dependencies

* clone this project
* on root folder, run bundle install. It will install all dependecies for you.

# How to run the project
* bundle exec rspec spec/features/01_login_spec.rb
* bundle exec rspec spec/features/02_flights_spec.rb
