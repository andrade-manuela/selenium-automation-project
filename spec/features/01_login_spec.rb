require_relative '../spec_helper'

feature 'Login Page: Validate Page Elements' do
  background do
    visit '/login'
  end

  scenario 'Displayed Title: Login' do
    expect(page).to have_css('h5', text: 'Login')
  end

  scenario 'Displayed Textbox: Email' do
    expect(page).to have_field('email')
  end

  scenario 'Displayed Textbox: Password' do
    expect(page).to have_field('password')
  end

  scenario 'Displayed Button: Login' do
    expect(page).to have_button('Login')
  end
end

feature 'Login Page: Valid credentials redirects user to Dashboard' do
  background do
    visit '/login'
  end

  scenario 'login with real username and password' do

    fill_in 'Email', with: 'user@phptravels.com'
    fill_in 'Password', with: 'demouser'
    click_button 'Login'

    expect(page).to have_content('Dashboard')
  end
end

feature 'Login page: Invalid credentials display alert to user' do
  background do
    visit '/login'
  end

  scenario "login with inexistent username and password" do
    visit '/login'
    
    fill_in 'Email', with: 'fakeuser@phptravels.com'
    fill_in 'Password', with: 'pass123'
    click_button 'Login'

    expect(page).to have_content('Wrong credentials. try again!')
    
  end
end
