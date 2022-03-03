require_relative '../spec_helper'
require 'date'

feature 'Flights Page: Validate Page Elements' do
  background do
    visit '/flights'
  end

  scenario 'Displayed Title: SEARCH FOR BEST FLIGHTS' do
    expect(page).to have_css('h2', text: 'SEARCH FOR BEST FLIGHTS')
  end

  scenario 'Displayed Textbox: Flying From' do
    expect(page).to have_field('from')
  end

  scenario 'Displayed Textbox: To Destination' do
    expect(page).to have_field('to')
  end

  scenario 'Displayed Date picker: Departure Date' do
    expect(page).to have_field('depart')
  end

  scenario 'Displayed Dropdown: Passengers' do
    expect(page).to have_css('#onereturn > div.col-lg-1.pr-0 > div > div > div > a')
  end

  scenario 'Displayed Button: Search' do
    expect(page).to have_button('Search')
  end
end

feature 'Flights Page: Validate page actions ' do
  background do
    visit '/flights'
  end
  
  def get_future_date(days)
    Date.today.next_day(days).strftime('%d-%m-%Y')
  end

  scenario 'Search for new flights' do

    #inputs departure 
    fill_in 'from', with: 'Lisboa'
    #selects departure 
    find('div', text: 'Lisbon, Portugal', match: :prefer_exact).click
    
    #inputs destination 
    fill_in 'to', with: 'John F Kennedy Intl'
    #selects destination 
    find('div', text: 'John F Kennedy Intl', match: :prefer_exact).click
    
    #selects date - making sure it will always be a valid date
    fill_in 'departure', with: get_future_date(20)
    
    #clicks on search button and checks if the user was redirected to results page
    find('#flights-search').click
    expect(page).to have_content('Total Flights')
  end

  scenario 'Book a flight' do

    #search for a flight, checks if the search returned a result and selects it
    fill_in 'from', with: 'LIS'
    find('div', text: 'Lisbon, Portugal', match: :prefer_exact).click
    fill_in 'to', with: 'JFK'
    find('div', text: 'John F Kennedy Intl', match: :prefer_exact).click
    fill_in 'departure', with: get_future_date(20)
    find('#flights-search').click
    find('button', text: 'Book Now', match: :first).click

    #checks if the user is redirected to flights booking page 
    expect(page).to have_content('Your Personal Information')

    #input users personal info
    element = page.find('.title', text: 'Your Personal Information').ancestor('.form-box')
    within element do
      fill_in 'First Name', with: 'Maria'
      fill_in 'Last Name', with: 'Silva'
      fill_in 'Email', with: 'maria@email.com'
      fill_in 'Phone', with: '+5583988888888'
      fill_in 'Address', with: 'Rua das Pedrinhas'
    end
    #country
    element.find('div.input-box', text: 'Country').find('.select2-container').click
    page.find('.select2-dropdown input.select2-search__field').send_keys("Brazil", :enter)
    #nationality
    element.find(:label, 'Nationality').ancestor('.input-box').find('.select2-container').click
    page.find('.select2-dropdown input.select2-search__field').send_keys("Brazil", :enter)
   
    #input users travel info
    select('MISS', :from => 'title_1')
    fill_in 'firstname_1', with: 'Maria'
    fill_in 'lastname_1', with: 'Silva'
    select('Brazil', :from => 'nationality_1')
    select('01 January', :from => 'dob_month_1')
    select('5', :from => 'dob_day_1')
    select('1984', :from => 'dob_year_1')
    fill_in 'passport_1', with: 'FSD98765'
    select('02', :from => 'passport_issuance_month_1')
    select('2', :from => 'passport_issuance_day_1')
    select('2020', :from => 'passport_issuance_year_1')
    select('02', :from => 'passport_month_1')
    select('2', :from => 'passport_day_1')
    select('2024', :from => 'passport_year_1')
    choose('gateway_pay-later')
    find('label[for="agreechb"]').click
    #find('.custom-checkbox').click
    find('button', text: 'Confirm Booking', match: :first).click
    
    #checks if user is redirected to booking page
    expect(page).to have_content('Reservation Number:')
    

  end
end

