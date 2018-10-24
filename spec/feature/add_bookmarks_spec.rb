
feature 'Add bookmark' do
  scenario 'user fills in new bookmark and clicks add' do
  visit('/')
  click_link 'Add'
  fill_in :new_bookmark_name, with: "http://amazon.co.uk"
  click_button 'Add'
  expect(page).to have_content "http://amazon.co.uk"
  end
end
