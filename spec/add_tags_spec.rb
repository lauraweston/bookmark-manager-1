feature 'Adding tags' do
  scenario 'add a tag to a new link' do

    visit '/links/new'
    fill_in 'title', :with => 'Makers Academy'
    fill_in 'url', :with => 'http://www.makersacademy.com'
    fill_in 'tag_name', :with => 'bananas'
    click_button 'Add link'

    expect(page.status_code).to eq 200
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('bananas')
    end
  end
end
