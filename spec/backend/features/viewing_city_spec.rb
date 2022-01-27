feature 'Viewing city' do
  after { Capybara.reset_sessions! }

  scenario 'initially set to London by default' do
    visit '/'
    expect(page.find('#city-name')).to have_content 'London'
  end

  scenario 'can be changed to another city' do
    visit '/'
    fill_in 'current-city', :with => 'Paris'
    click_button 'Submit'
    expect(page.find('#city-name')).to have_content 'Paris'
    expect(page.find('#city-name')).not_to have_content 'London'
  end

  scenario 'the newly selected city is persisted' do
    visit '/'
    expect(page.find('#city-name')).to have_content 'Paris'
    expect(page.find('#city-name')).not_to have_content 'London'
  end
end
