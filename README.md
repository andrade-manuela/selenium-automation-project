# selenium-automation-project

The goal of this project is to run automated tests in a web based application using Selenium-webriver with ruby. In order to make it more powerful and ornanized I also used Capybara and RSpec.
<h4>Stack used:</h4>
<h5>You just need to install Bundler.</h5>

* Bundler: <code> gem install bundler </code>
* Ruby - https://rubyinstaller.org/downloads/
* RSpec (used for assertions) - <code>gem install rspec</code>
* Capybara (used to simulate the real user in a application) - <code>gem install capybara</code>

# How to install dependencies

* clone this project
* on root folder, run <code>bundle install</code>. It will install all dependecies for you.

# How to run test cases
* <code>bundle exec rspec spec/features/01_login_spec.rb </code>
* <code>bundle exec rspec spec/features/02_flights_spec.rb</code>
