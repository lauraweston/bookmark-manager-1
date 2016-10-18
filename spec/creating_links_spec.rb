feature 'Creating new links' do
  scenario 'adding a site address and title to the bookmark manager' do

    visit '/links/new'
    fill_in 'title', :with => 'Makers Academy'
    fill_in 'url', :with => 'http://www.makersacademy.com'
    click_button 'Add link'

    expect(page.status_code).to eq 200
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('http://www.makersacademy.com')
    end
  end
end
