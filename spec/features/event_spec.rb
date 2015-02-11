require 'rails_helper'

describe 'User can CRUD locations' do

  scenario 'User visit a show page for an event.' do
      # visit root
      visit '/'

      # click on link to go to new location form
      click_on "New Location"

      #filling out form for location
      fill_in 'location[name]', :with => "Galvanize"
      fill_in 'location[address]', with: "New Address"
      fill_in 'location[zipcode]', with: "90210"

      #submitting form to create a location
      click_on "Create Location"

      click_on "Add Event"

      fill_in 'event[description]',:with => "School"
      fill_in 'event[date]', :with => "01/01/2015"
      check 'event[requires_id]'
      click_on "Create Event"
      click_on "School"
      expect(page).to have_content("School")
      expect(page).to have_content("2015-01-01")
      expect(page).to have_content("true")
  end

  scenario 'Users can edit an event.' do
    # visit root
    visit '/'

    # click on link to go to new location form
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Galvanize"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"

    click_on "Add Event"

    fill_in 'event[description]',:with => "School"
    fill_in 'event[date]', :with => "01/01/2015"
    check 'event[requires_id]'
    click_on "Create Event"
    click_on "Edit"
    fill_in 'event[description]', :with => "School2"
    click_on "Update Event"

    expect(page).to have_content("School2")

  end

  scenario 'Users can delete an event.' do
    # visit root
    visit '/'

    # click on link to go to new location form
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Galvanize"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"

    click_on "Add Event"

    fill_in 'event[description]',:with => "School"
    fill_in 'event[date]', :with => "01/01/2015"
    check 'event[requires_id]'
    click_on "Create Event"

    click_on "Delete"

    expect(page).to have_no_content("School2")
  end
end
