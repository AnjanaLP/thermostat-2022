feature 'Viewing homepage' do
  scenario 'can see a welcome message' do
    visit '/'
    expect(page).to have_content "Welcome to Thermostat"
  end
end
