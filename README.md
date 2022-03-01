# selenium-automation-project
<h5>The goal of this project is to run automated tests in a web based application using Selenium-WebDriver. In order to make it more powerful and organized I also used RSpec and Capybara.</h5>

<h3>Stack</h3>

* Ruby
* Bundler 
* RSpec (used for assertions)
* Capybara (used to simulate the real user in a application)

<h3>Installing dependencies</h3>

* Clone this project
* Install bundler
<code> gem install bundler</code>
* Run
<code> bundle install</code>

all dependencies should be installed by this point and you can go ahead and run the tests.
<h3>Running tests </h3>

* You can run all tests at once:

<code> bundle exec rspec spec/features/* </code>

* or even choose an specific one

<code> bundle exec rspec spec/features/02_flights_spec.rb </code>
