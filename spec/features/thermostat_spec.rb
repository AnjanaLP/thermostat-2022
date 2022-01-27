feature 'View temperature' do
  scenario 'see the default starting temperature' do
    visit '/'
    expect(page).to have_content "20"
  end
end
