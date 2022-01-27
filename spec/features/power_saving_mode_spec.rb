feature 'Power saving mode' do
  before do
    visit '/'
  end

  scenario 'see that it is on by default' do
    expect(page.find('#psm-status')).to have_content 'on'
  end

  context 'when switched off' do
    before do
      page.find('#psm-off').click
    end

    scenario 'see the status as off' do
      expect(page.find('#psm-status')).to have_content 'off'
      expect(page.find('#psm-status')).not_to have_content 'on'
    end

    scenario 'has a maximum temperature of 32' do
      13.times { page.find('#temperature-up').click }
      expect(page.find('#temperature')).to have_content '32'
      expect(page.find('#temperature')).not_to have_content '33'
    end
  end

  context 'when switched on' do
    scenario 'see the status as on' do
      page.find('#psm-off').click
      page.find('#psm-on').click
      expect(page.find('#psm-status')).to have_content 'on'
      expect(page.find('#psm-status')).not_to have_content 'off'
    end

    scenario 'has a maximum temperature of 25' do
      6.times { page.find('#temperature-up').click }
      expect(page.find('#temperature')).to have_content '25'
      expect(page.find('#temperature')).not_to have_content '26'
    end

    scenario 'resets the temperature if it is over 25' do
      page.find('#psm-off').click
      10.times { page.find('#temperature-up').click }
      expect(page.find('#temperature')).to have_content '30'
      page.find('#psm-on').click
      expect(page.find('#temperature')).to have_content '25'
    end
  end
end
