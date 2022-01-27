feature 'Viewing temperature' do
  before { visit '/' }

  scenario 'initially see the default temperature' do
    expect(page.find('#temperature')).to have_content '20'
    expect(page).to have_css '.medium-usage'
  end

  context 'when the temperature is increased' do
    scenario 'see the change up' do
      page.find('#temperature-up').click
      expect(page.find('#temperature')).to have_content '21'
      expect(page.find('#temperature')).not_to have_content '20'
    end
  end

  context 'when the temperature is decreased' do
    scenario 'see the change down' do
      2.times { page.find('#temperature-down').click }
      expect(page.find('#temperature')).to have_content '19'
      expect(page.find('#temperature')).not_to have_content '20'
    end

    scenario 'has a minimum temperature' do
      10.times { page.find('#temperature-down').click }
      expect(page.find('#temperature')).to have_content '10'
      expect(page.find('#temperature')).not_to have_content '9'
      expect(page).to have_css '.low-usage'
    end
  end

  context 'when the temperature is reset' do
    scenario 'see the default temperature' do
      expect(page.find('#temperature')).to have_content '10'
      page.find('#temperature-reset').click
      expect(page.find('#temperature')).to have_content '20'
      expect(page.find('#temperature')).not_to have_content '10'
    end
  end
end
