feature 'Viewing temperature' do
  before do
    visit '/'
  end

  scenario 'initially see the default temperature' do
    expect(page).to have_content "20"
  end

  context 'when the temperature is increased' do
    scenario 'see the change up' do
      page.find('#temperature-up').click
      expect(page.find('#temperature')).to have_content '21'
      expect(page.find('#temperature')).not_to have_content '20'
    end
  end

  xcontext 'when the temperature is decreased' do
    scenario 'see the change down' do
      page.find('#temperature-down').click
      expect(page.find('#temperature')).to have_content '19'
      expect(page.find('#temperature')).not_to have_content '20'
    end
  end

  xcontext 'when the temperature is reset' do
    scenario 'see the default temperature' do
      5.times { page.find('#temperature-up').click }
      expect(page.find('#temperature')).to have_content '25'
      page.find('#temperature-reset').click
      expect(page.find('#temperature')).to have_content '20'
      expect(page.find('#temperature')).not_to have_content '25'
    end
  end
end
