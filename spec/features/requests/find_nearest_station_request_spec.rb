require 'rails_helper'

RSpec.describe 'Find Nearest Station' do
  before :each do
    visit '/'
    select 'Griffin Coffee', from: 'location'
    click_button 'Find Nearest Station'
  end
  it 'Displays the closest electric fuel station to me' do

    expect(current_path).to eq('/search')
    expect(page).to have_content('The closest electric fuel station to you is: Target T2225')
    expect(page).to have_content('Address: 1985 Sheridan Blvd. Edgewater, CO 80214')
    expect(page).to have_content('Fuel Type: ELEC')
    expect(page).to have_content('Access Times: 24 hours daily')
  end

  it 'Displays distance of nearest station' do
    expect(page).to have_content('Directions')
    expect(page).to have_content('Distance to this station: 0.423')
  end

  it 'Displays travel time from starting location to fuel station' do
    expect(page).to have_content('Travel time: 00:01:16')
  end

  it 'Displays direction instructions to get to that fuel station' do
    # ex: ".... Turn left onto Lowell,  Destination will be on the right"
    expect(page).to have_content('Direction Instructions:')
    expect(page).to have_content('Start out going east on W 25th Ave toward Sheridan Blvd/CO-95.')
    expect(page).to have_content('Turn right onto Sheridan Blvd/CO-95.')
    expect(page).to have_content('1985 SHERIDAN BLVD is on the right.')
  end
end
